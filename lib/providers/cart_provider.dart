import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';
import 'package:xpress_mobile_pos/helpers/sp_helper.dart';
import 'package:xpress_mobile_pos/models/menu.dart';
import 'package:xpress_mobile_pos/models/modifier_item.dart';
import 'package:xpress_mobile_pos/models/order.dart';
import 'package:xpress_mobile_pos/models/orderDetails_modifierList.dart';
import 'package:xpress_mobile_pos/models/order_detailList.dart';
import 'package:xpress_mobile_pos/models/order_item.dart';
import 'package:xpress_mobile_pos/models/menu_item.dart';
import 'package:xpress_mobile_pos/models/staff.dart';
import 'package:xpress_mobile_pos/models/variant_list.dart';

class CartProvider extends ChangeNotifier {
  List<OrderItem> _orderItems = [];
  List<OrderItem> get orderItems => _orderItems;

  double get subtotal => _orderItems.fold(0, (total, current) => total + current.totalAmt);

  double get tax => _order.totalTaxAmt;

  double get total => _order.totalAmt;

  Order _order;
  Order get order => _order;
  set order(Order newOrder) {
    assert(newOrder != null);
    _order = newOrder;
    canEditOrder = order.orderStatus == OrderStatus.OPEN && order.depositAmt == 0 && order.paidAmt == 0;
  }

  MenuItem _selectedMenuItem;
  MenuItem get selectedMenuItem => _selectedMenuItem;
  set selectedMenuItem(dynamic item) => _selectedMenuItem = item; 

  Menu _menuGroup;
  Menu get menuGroup => _menuGroup;
  set menuGroup(dynamic value) => _menuGroup = value;

  OrderDetailsModifierList _selectedModifierDetail;
  OrderDetailsModifierList get selectedModifierDetail => _selectedModifierDetail;
  set selectedModifierDetail(dynamic value) => _selectedModifierDetail = value;

  OrderDetailsList _selectedOrderDetail;
  OrderDetailsList get selectedOrderDetail => _selectedOrderDetail;
  set selectedOrderDetail(dynamic value) {
    _selectedOrderDetail = value;
    _updateOriginalDetail(); 
  }

  Staff get staff => SpHelper.getObj('staff', (v) => Staff.fromJson(v));

  OrderDetailsList originalDetail;
  List<OrderDetailsList> shownOrderDetails;
  bool canEditOrder;

  void initOrder() {
    Order order = new Order.origin(orderType: OrderType.TOGO, guest: 1);
    print('init order: $order');
    shownOrderDetails = order.getNonDeletedDetails();
    this.order = order;
    this.order.calculateTotals();
  }

  void add(MenuItem item) {
    _selectedMenuItem = item;
    var x = order.createOrderDetailList(_selectedMenuItem, menuGroupId: this.menuGroup.id);
    if (shownOrderDetails.singleWhere((s) => s.id == x.id, orElse: () => null) == null) shownOrderDetails.add(x);
    selectedOrderDetail = x;
    selectedModifierDetail = null;
    print('add item: $x');
    notifyListeners();
  }

  void addModifier(ModifierItem modifier) {
    selectedModifierDetail = selectedOrderDetail.toggleModifierItem(modifier);
    notifyListeners();
  }

  void addVariant(VariantList variant) {
    selectedOrderDetail.toggleVariant(variant);
    notifyListeners();
  }

  void clearOrderItems() {
    _orderItems.clear();
    notifyListeners();
  }

  void clearCart() {
    _orderItems.clear();
    order = null;
    // initOrder();
    notifyListeners();
  }

  Future<bool> saveOrder() async {
    if (await order.saveOrder()) {
      return true;
    }
    return false;
  }


  void _updateOriginalDetail() {
    if (selectedOrderDetail != null) {
      if (originalDetail == null) originalDetail = new OrderDetailsList();
      originalDetail.modifierList = [];
      for (var modifier in selectedOrderDetail.modifierList) {
        var list = new OrderDetailsModifierList(
          id: Uuid().v1().toString().replaceAll('-', ''));
          originalDetail.modifierList.add(list);
      }
    }
  }

  void addQty() {
    if (selectedModifierDetail != null) {
      if (selectedOrderDetail != null || selectedModifierDetail != null) {
        var modifier = selectedOrderDetail.modifierList.firstWhere((f) => f.id == selectedModifierDetail.id, orElse: null);
        if (modifier != null) setModifierQty(modifier.qty + 1);
      }
    } else {
      if (selectedOrderDetail != null && canEditOrder) {
        setItemQty(selectedOrderDetail.qty + 1);
      }
    }
    notifyListeners();
  }

  void setModifierQty(int qty) {
    if (selectedOrderDetail != null && selectedModifierDetail != null && canEditOrder) {
      if (!selectedOrderDetail.canDelete()) _updateOriginalDetail();

      selectedOrderDetail.modifierItemSetQty(selectedModifierDetail.modifierItem, qty);

      //todo send changes modifier printer

      if (selectedModifierDetail.qty < 1 && selectedOrderDetail.modifierList.length > 0) selectedModifierDetail = selectedOrderDetail.modifierList.last;
      else if (selectedOrderDetail.modifierList.length < 1) selectedModifierDetail = null;
    }
  }

  void setItemQty(int qty) {
    if (canEditOrder && selectedOrderDetail != null) {
      if (!selectedOrderDetail.canDelete()) _updateOriginalDetail();
      selectedOrderDetail.qty = qty;

      //todo send changes modifier printer

      if (qty < 1) {
        var selectedIndex = shownOrderDetails.indexOf(selectedOrderDetail);
        shownOrderDetails.remove(selectedOrderDetail);
        if (shownOrderDetails.isEmpty) {
          selectedOrderDetail = null;
        } else {
          var nextSelection = shownOrderDetails.elementAt(selectedIndex < 1 ? 0 : selectedIndex - 1);
          selectedOrderDetail = nextSelection;
        }
      }
    }
  }

  void reduceQty() {
    if (selectedModifierDetail != null) {
      if (selectedOrderDetail != null && selectedModifierDetail != null) {
        var modifier = selectedOrderDetail.modifierList.firstWhere((f) => f.id == selectedModifierDetail.id, orElse: null);
        if (modifier != null) setModifierQty(modifier.qty - 1);
      } 
    } else if (selectedOrderDetail != null) {
      bool doContinue = true;
      if (_shouldPromptForDelete(QuantityMode.DECREMENT, 1)) {
        //todo display delete reason dialog
      }
      if (doContinue) {
        if (selectedOrderDetail != null && canEditOrder) {
          setItemQty(selectedOrderDetail.qty - 1);
        }
        if (selectedOrderDetail != null && selectedOrderDetail.qty < 2 && selectedMenuItem != null) {
          if (selectedMenuItem.isFullScreenModifiers) {
            //todo display full modifiers screen
          } else {
            //todo display small modifier screen
          }
        }
      }
    }
    notifyListeners();
  }

  bool _shouldPromptForDelete(int mode, int qty) {
    if (selectedOrderDetail != null && selectedOrderDetail.status == OrderDetailStatus.SENT) {
      switch (mode) {
        case QuantityMode.SET:
          return qty == 0;
        case QuantityMode.DECREMENT:
          return selectedOrderDetail.qty <= qty;
      }
    }
    return false;
  }

  void deleleItem() {
    if (selectedModifierDetail != null) {
      setModifierQty(0);
    } else {
      bool doContinue = true;
      if (_shouldPromptForDelete(QuantityMode.SET, 0)) {
        //todo display delete reason dialog
      }
      if (doContinue) {
        if (selectedOrderDetail != null && canEditOrder) {
          setItemQty(selectedOrderDetail.qty - 1);
        }
        if (selectedOrderDetail != null && selectedOrderDetail.qty < 2 && selectedMenuItem != null) {
          if (selectedMenuItem.isFullScreenModifiers) {
            //todo display full modifiers screen
          } else {
            //todo display small modifier screen
          }
        }
      }
    }
    notifyListeners();
  }

  void selectItemDetail(int index) {
    selectedOrderDetail = shownOrderDetails.elementAt(index);
    notifyListeners();
  }
}

class QuantityMode {
  static const DECREMENT = 1;
  static const INCREMENT = 2;
  static const SET = 3;
}
