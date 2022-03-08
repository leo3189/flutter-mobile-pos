import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobile_pos/helpers/database_helper.dart';
import 'package:flutter_mobile_pos/helpers/name_helper.dart';
import 'package:flutter_mobile_pos/models/menu.dart';
import 'package:flutter_mobile_pos/models/menu_category.dart';
import 'package:flutter_mobile_pos/models/menu_item.dart';
import 'package:flutter_mobile_pos/models/modifier_group.dart';
import 'package:flutter_mobile_pos/models/modifier_item.dart';
import 'package:flutter_mobile_pos/models/variant_group.dart';
import 'package:flutter_mobile_pos/models/variant_list.dart';
import 'package:flutter_mobile_pos/providers/cart_provider.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  void _backButton() {
    Navigator.of(context).pop();
    Provider.of<CartProvider>(context, listen: false).clearOrderItems();
  }

  @override
  void initState() {
    super.initState();
    Provider.of<CartProvider>(context, listen: false).initOrder();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => _backButton(),
        ),
      ),
      body: Row(
        children: <Widget>[
          OrderPanel(),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              child: MenuPanel()
            ) 
          ),
        ],
      ),
    );
  }
}

class OrderPanel extends StatefulWidget {
  @override
  _OrderPanelState createState() => _OrderPanelState();
}

class _OrderPanelState extends State<OrderPanel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(600),
      child: Column(
        children: <Widget>[
          Expanded(
            child: OrderList(),
          ),
          Container(
            height: ScreenUtil().setHeight(130),
            child: ActionPanel(),
          )
        ],
      ),
    );
  }
}

class OrderList extends StatefulWidget {
  OrderList({
    Key key,
  }) : super(key: key);

  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    var cart = context.watch<CartProvider>();

    Timer(
      Duration(microseconds: 1),
      () => _controller.animateTo(
        _controller.position.maxScrollExtent,
        duration: Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
      )
    );

    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Togo'),
              Text(
                cart.order.seqNum > 0 ? '#'+cart.order.seqNum.toString() : ''
              ),
              Text('Server: ' + cart.staff.firstName)
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 5, bottom: 5),
          decoration: BoxDecoration(color: Colors.grey[350]),
          child: Table(
            columnWidths: {0: FractionColumnWidth(.15), 2: FractionColumnWidth(.15)},
            children: [
              TableRow(
                children: [
                  TableCell(
                    child: Container(
                      margin: EdgeInsets.all(5),
                      child: Text(
                        'QTY',
                        textAlign: TextAlign.center,
                      ),
                    )
                  ),
                  TableCell(
                    child: Container(
                      margin: EdgeInsets.all(5),
                      child: Text(
                        'Item',
                      ),
                    ),
                  ),
                  TableCell(
                    child: Container(
                      margin: EdgeInsets.all(5),
                      child: Text(
                        'Price',
                        textAlign: TextAlign.right,
                      ),
                    ),
                  )
                ]
              ),
            ],
          )
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border(right: BorderSide(width: 1, color: Colors.grey[350]))
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(right: BorderSide(width: 1, color: Colors.grey[350]))
                    ),
                    child:  ListView.builder(
                      controller: _controller,
                      itemCount: cart.shownOrderDetails.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => Provider.of<CartProvider>(context, listen: false).selectItemDetail(index),
                          child: Table(
                            columnWidths: {0: FractionColumnWidth(.15), 2: FractionColumnWidth(.18)},
                            children: [
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Container(
                                      margin: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black45)
                                      ),
                                      child: Text(
                                        cart.shownOrderDetails[index].qty.toString(),
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ),
                                  TableCell(
                                    child: Container(
                                      margin: EdgeInsets.all(5),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            NameHelper.currentName(cart.shownOrderDetails[index].menuItem.nameList) + 
                                            (cart.shownOrderDetails[index].variantList.isNotEmpty 
                                              ? " (" + NameHelper.currentName(cart.shownOrderDetails[index].variantList.first.variant.nameList, isVariantGroup: true) + ")"
                                              : ""
                                            ),
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87
                                            ),
                                          ),
                                          ...cart.shownOrderDetails[index].modifierList.map((modifier) => 
                                            Container(
                                              margin: EdgeInsets.only(top: 10),
                                              child: Text(
                                                modifier.qty.toString() + "x " + NameHelper.currentName(modifier.modifierItem.nameList) + " \$" + modifier.totalAmt.toStringAsFixed(2),
                                                style: TextStyle(
                                                  color: Colors.black54
                                                ),
                                              )
                                            )
                                          ).toList()
                                        ]
                                      ),
                                    )
                                  ),
                                  TableCell(
                                    child: Container(
                                      margin: EdgeInsets.all(5),
                                      child: Text(
                                        '\$' + cart.shownOrderDetails[index].subtotalAmt.toStringAsFixed(2),
                                        textAlign: TextAlign.right,
                                      ),
                                    )
                                  )
                                ]
                              ),
                            ],
                          )
                        ); 
                      }
                    ),
                  ),
                ),
                Container(
                  width: ScreenUtil().setWidth(120),
                  child: ListView(
                    children: [
                      _addQtyButton(),
                      _reduceQtyButton(),
                      _deleteItemButton(),
                      _itemRemarkButton(),
                      _priceOverrideButton(),
                      _itemDiscountButton(),
                    ],
                  )
                )
              ],
            ),
          ),
        ),
        Container(
          height: ScreenUtil().setHeight(200),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(color: Color.fromRGBO(241, 255, 255, 1)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Subtotal:'),
                  Text('\$ ' + cart.order.subtotalAmt.toStringAsFixed(2))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Tax:'),
                  Text('\$ ' + cart.order.totalTaxAmt.toStringAsFixed(2))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Total:'),
                  Text('\$ ' + cart.order.totalAmt.toStringAsFixed(2))
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _addQtyButton() {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1, color: Colors.grey[350]))
      ),
      width: ScreenUtil().setWidth(120),
      height: ScreenUtil().setHeight(150),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.add_box_outlined),
            onPressed: () => Provider.of<CartProvider>(context, listen: false).addQty(),
          ),
          Text(
            'Add',
            style: TextStyle(fontSize: ScreenUtil().setSp(25)),
          )
        ],
      )
    );
  }

  Widget _reduceQtyButton() {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1, color: Colors.grey[350]))
      ),
      width: ScreenUtil().setWidth(120),
      height: ScreenUtil().setHeight(150),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.minimize),
            onPressed: () => Provider.of<CartProvider>(context, listen: false).reduceQty(),
          ),
          Text(
            'Reduce',
            style: TextStyle(fontSize: ScreenUtil().setSp(25)),
          )
        ],
      )
    );
  }

   Widget _deleteItemButton() {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1, color: Colors.grey[350]))
      ),
      width: ScreenUtil().setWidth(120),
      height: ScreenUtil().setHeight(150),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => Provider.of<CartProvider>(context, listen: false).deleleItem(),
          ),
          Text(
            'Delete',
            style: TextStyle(fontSize: ScreenUtil().setSp(25)),
          )
        ],
      )
    );
  }

  Widget _itemRemarkButton() {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1, color: Colors.grey[350]))
      ),
      width: ScreenUtil().setWidth(120),
      height: ScreenUtil().setHeight(150),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: null,
          ),
          Text(
            'Remark',
            style: TextStyle(fontSize: ScreenUtil().setSp(25)),
          )
        ],
      )
    );
  }

   Widget _priceOverrideButton() {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1, color: Colors.grey[350]))
      ),
      width: ScreenUtil().setWidth(120),
      height: ScreenUtil().setHeight(150),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.attach_money),
            onPressed: null,
          ),
          Text(
            'Price Override',
            style: TextStyle(fontSize: ScreenUtil().setSp(25)),
          )
        ],
      )
    );
  }

   Widget _itemDiscountButton() {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1, color: Colors.grey[350]))
      ),
      width: ScreenUtil().setWidth(120),
      height: ScreenUtil().setHeight(150),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: null,
          ),
          Text(
            'Item Discount',
            style: TextStyle(fontSize: ScreenUtil().setSp(25)),
          )
        ],
      )
    );
  }
}

class ActionPanel extends StatefulWidget {
  @override
  _ActionPanelState createState() => _ActionPanelState();
}

class _ActionPanelState extends State<ActionPanel> {
  Future<void> _savePressed() async {
    var saveOrder = await Provider.of<CartProvider>(context, listen: false).saveOrder();
    if (saveOrder) context.read<CartProvider>().clearOrderItems();
  }

  Future<void> _checkoutPresed() async {
    var saveOrder = await context.read<CartProvider>().saveOrder();
    if (saveOrder) Navigator.pushNamed(context, '/checkout');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _saveButton()),
        Expanded(child: _checkoutButton())
      ]
    );
  }

  Widget _saveButton() {
    return Container(
      padding: EdgeInsets.all(5),
      child: ElevatedButton(
        onPressed: _savePressed, 
        child: Center(
          child: Text(
            'Save',
          ),
        )
      ),
    );
  }

  Widget _checkoutButton() {
    return Container(
      padding: EdgeInsets.all(5),
      child: ElevatedButton(
        onPressed: _checkoutPresed, 
        child: Center(
          child: Text(
            'Checkout'
          ),
        )
      ),
    );
  }
}


class MenuPanel extends StatefulWidget {
  MenuPanel({
    Key key,
    this.addedItem
  }): super(key: key);

  final ValueChanged<bool> addedItem;

  @override
  _MenuPanelState createState() => _MenuPanelState();
}

class _MenuPanelState extends State<MenuPanel> {
  List<Menu> _menuGroup = [];
  List<MenuCategory> _menuCategory = [];
  List<MenuItem> _menuItems = [];
  List<ModifierGroup> _modifierGroups = [];
  List<ModifierItem> _modifierItems = [];
  List<VariantGroup> _variantGroups = [];
  List<VariantList> _variantList = [];
  int _menuCategorySelectedIndex;
  int _menuItemSelectedIndex;

  void _loadMenu() async {
    DatabaseHelper.instance.getAllMenu().then((value) => {
      setState(() {
        _menuGroup = value;
        _menuOnChanged(0);
      })
    });
  }

  void _menuOnChanged(int index) async {
    var menu = _menuGroup[index];
    DatabaseHelper.instance.getMenuCategoriesByMenuGroup(menu.id).then((value) => {
      setState(() {
        _menuCategory = value;
        _menuCategorySelectedIndex = 0;
        _categoryOnChanged(0);
        Provider.of<CartProvider>(context, listen: false).menuGroup = menu;
      })
    });
  }

  void _categoryOnChanged(int index) async {
    DatabaseHelper.instance.getMenuItemsByCategoryId(_menuCategory[index].id).then((value) => {
      setState(() {
        _menuItems = value;
        _menuCategorySelectedIndex = index;
        _menuItemSelectedIndex = -1;
        _modifierItems = [];
        _variantList = [];
      })
    });
  }

  void _itemOnChanged(int index) {
    var menuItem = _menuItems[index];
    Provider.of<CartProvider>(context, listen: false).add(menuItem);
    _showItemModifier(index);
    _showVariantGroup(index);

    setState(() {
      _menuItemSelectedIndex = index;
    });
  }

  void _showItemModifier(int index) {
    var menuItem = _menuItems[index];
    if (menuItem.modifierGroups.length < 0) {
      setState(() {
        _modifierItems = [];
      });
      return;
    }
    DatabaseHelper.instance.getModifierGroupsByMenuItem(menuItem.id).then((value) => {
      setState(() {
        _modifierGroups = value;
        List<ModifierItem> modifierItems = [];
        _modifierGroups.forEach((e) { modifierItems.addAll(e.modifierItems); });
        _modifierItems = modifierItems;
      })
    });
  }

  void _modifierOnChanged(ModifierItem item) {
    Provider.of<CartProvider>(context, listen: false).addModifier(item);
  }

  void _showVariantGroup(int index) {
    var menuItem = _menuItems[index];
    if (menuItem.variantGroups.length <= 0) {
      setState(() {
        _variantList = [];
      });
      return;
    }
    DatabaseHelper.instance.getVariantGroupsByMenuItem(menuItem.id).then((value) => {
      setState(() {
        _variantGroups = value;

        List<String> variantIds = [];
        menuItem.priceList.forEach((e) { variantIds.add(e.variantIds); });

        List<VariantList> variantList = [];
        _variantGroups.forEach((e) { variantList.addAll(e.variantList); });

        _variantList = [];
        for (var v in variantList) {
          variantIds.forEach((e) { 
            if (v.id.toString() == e) {
              _variantList.add(v);
            }
          });
        }
        
        var defaultVariant = menuItem.priceList.where((w) => w.isDefault == true).single;
        var variant = _variantList.where((w) => w.id.toString() == defaultVariant.variantIds).single;
        Provider.of<CartProvider>(context, listen: false).addVariant(variant);
      })
    });
  }

  void _variantOnChanged(VariantList variant) {
    Provider.of<CartProvider>(context, listen: false).addVariant(variant);
  }

  @override
  void initState() {
    super.initState();
    _loadMenu();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: DisplayMenuGroup(
              menu: _menuGroup,
              menuGroupOnChanged: _menuOnChanged,
            ),
          ),
          Offstage(offstage: _menuGroup.length < 0, child: Divider(thickness: 2,)),
          Container(
            child: DisplayMenuCategory(
              menuCategory: _menuCategory,
              selectedIndex: _menuCategorySelectedIndex,
              categoryOnChanged: _categoryOnChanged,
            ),
          ),
          Divider(
            thickness: 2,
          ),
          Expanded(
            child: Container(
              child: DisplayMenuItem(
                menuItems: _menuItems,
                seletecdIndex: _menuItemSelectedIndex,
                itemOnChanged: _itemOnChanged,
              ),
            )
          ),
          Offstage(offstage: _modifierItems.length <= 0 && _variantList.length <= 0, child: Divider(thickness: 2,)),
          Offstage(
            offstage: _variantList.length <= 0,
            child: Container(
              height: 45,
              child: DisplayVariant(
                variantList: _variantList,
                // selectedVariant: _selectedVariant,
                variantOnChanged: _variantOnChanged,
              ),
            )
          ),
          Offstage(
            offstage: _modifierItems.length <= 0,
            child: Container(
              height: 45,
              child: DisplayModifier(
                modifierItems: _modifierItems,
                // selectedModification: _selectedMofication,
                modifierOnChanged: _modifierOnChanged,
              ),
            )
          )
        ],
      ),
    );
  }
}

class DisplayMenuGroup extends StatefulWidget {
  DisplayMenuGroup({
    Key key,
    this.menu,
    @required this.menuGroupOnChanged
  }) : super(key: key);

  final List<Menu> menu;
  final ValueChanged<int> menuGroupOnChanged;

  @override
  _DisplayMenuGroupState createState() => _DisplayMenuGroupState();
}

class _DisplayMenuGroupState extends State<DisplayMenuGroup> {
  int _selectedIndex = 0;

  void _selectMenuGroup(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.menuGroupOnChanged(index);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 6,
        childAspectRatio: 3.5
      ), 
      itemCount: widget.menu.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () => _selectMenuGroup(index),
          child: Container(
            child: Card(
              color: _selectedIndex == index ? Theme.of(context).primaryColor : null,
              child: GridTile(
                child: Center(
                  child: Text(
                    // widget.menu[index].nameList[0].localName,
                    NameHelper.currentName(widget.menu[index].nameList),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: _selectedIndex == index ? Colors.white : null
                    ),
                  ),
                )
              ),
            ),
          ),
        );
      }
    );
  }
}

class DisplayMenuCategory extends StatefulWidget {
  DisplayMenuCategory({
    Key key,
    this.menuCategory,
    this.selectedIndex,
    @required this.categoryOnChanged
  }) : super(key: key);

  final List<MenuCategory> menuCategory;
  final ValueChanged<int> categoryOnChanged;
  final int selectedIndex;

  @override
  _DisplayMenuCategory createState() => _DisplayMenuCategory();
}

class _DisplayMenuCategory extends State<DisplayMenuCategory> {
  void _selectCategory(int index) {
    widget.categoryOnChanged(index);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 6,
        childAspectRatio: 3.5
      ), 
      itemCount: widget.menuCategory.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () => _selectCategory(index),
          child: Container(
            child: Card(
              color: widget.selectedIndex == index ? Theme.of(context).primaryColor : null,
              child: GridTile(
                child: Center(
                  child: Text(
                    // widget.menuCategory[index].nameList[0].localName,
                    NameHelper.currentName(widget.menuCategory[index].nameList),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: widget.selectedIndex == index ? Colors.white : null
                    ),
                  ),
                )
              ),
            ),
          ),
        );
      }
    );
  }
}

class DisplayMenuItem extends StatefulWidget {
  DisplayMenuItem({
    Key key,
    this.menuItems,
    this.seletecdIndex,
    @required this.itemOnChanged,
  }) : super(key: key);

  final List<MenuItem> menuItems;
  final ValueChanged<int> itemOnChanged;
  final int seletecdIndex;

  @override
  _DisplayMenuItemState createState() => _DisplayMenuItemState();
}

class _DisplayMenuItemState extends State<DisplayMenuItem> {
  void _selectItem(int index) {
    widget.itemOnChanged(index);
  }

  @override
  Widget build(BuildContext context) {
     return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 6,
        childAspectRatio: MediaQuery.of(context).size.width / MediaQuery.of(context).size.height
      ), 
      itemCount: widget.menuItems.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () => _selectItem(index),
          child: Container(
            child: Card(
              color: widget.seletecdIndex == index ? Theme.of(context).primaryColor : null,
              child: GridTile(
                child: Center(
                  child: Text(
                    // widget.menuItems[index].nameList[0].localName,
                    NameHelper.currentName(widget.menuItems[index].nameList),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: widget.seletecdIndex == index ? Colors.white : null
                    ),
                  ),
                ),
                footer: Center(
                  child: Text(
                    "\$" + widget.menuItems[index].defaultPrice.toStringAsFixed(2),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: widget.seletecdIndex == index ? Colors.white : null
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}

class DisplayVariant extends StatefulWidget {
  DisplayVariant({
    Key key,
    this.variantList,
    this.variantOnChanged,
  });

  final List<VariantList> variantList;
  final ValueChanged<VariantList> variantOnChanged;

  @override
  _DisplayVariantState createState() => _DisplayVariantState();
}

class _DisplayVariantState extends State<DisplayVariant> {
  void _selectVariant(VariantList variant) {
    widget.variantOnChanged(variant);
  }

  bool _isSelected(int id, CartProvider cart) {
    var index = cart.selectedOrderDetail.variantList.indexWhere((i) => i.variantID == id);
    if (index == -1) return false;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.variantList.length,
      itemBuilder: (BuildContext context, int index) {
        return Consumer<CartProvider>(
          builder: (context, cart, child) =>
            GestureDetector(
            onTap: () => _selectVariant(widget.variantList[index]),
            child: SizedBox(
              width: 120,
              child: Card(
                color: _isSelected(widget.variantList[index].id, cart) ? Theme.of(context).primaryColor : null,
                child: GridTile(
                  child: Center(
                    child: Text(
                      // widget.variantList[index].nameList[0].fullName,
                      NameHelper.currentName(widget.variantList[index].nameList, isVariantGroup: true),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: _isSelected(widget.variantList[index].id, cart)  ? Colors.white : null
                      ),
                    )
                  ),
                ),
              ),
            ),
          )
        );
      }
    );
  }
}

class DisplayModifier extends StatefulWidget {
  DisplayModifier({
    Key key,
    this.modifierItems,
    @required this.modifierOnChanged
  }) : super(key: key);

  final List<ModifierItem> modifierItems;
  final ValueChanged<ModifierItem> modifierOnChanged;

  @override
  _DisplayModifierState createState() => _DisplayModifierState();
}

class _DisplayModifierState extends State<DisplayModifier> {
  void _selectModifier(ModifierItem item) {
    widget.modifierOnChanged(item);
  }

  bool _isSelected(int id, CartProvider cart) {
    var index = cart.selectedOrderDetail.modifierList.indexWhere((i) => i.modifierItemID == id);
    if (index == -1) return false;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.modifierItems.length,
      itemBuilder: (BuildContext context, int index) {
        return Consumer<CartProvider>(
          builder: (context, cart, child) => 
            GestureDetector(
              onTap: () => _selectModifier(widget.modifierItems[index]),
              child: SizedBox(
                width: 120,
                child: Card(
                  color: _isSelected(widget.modifierItems[index].id, cart) ? Theme.of(context).primaryColor : null,
                  child: GridTile(
                    child: Center(
                      child: Text(
                        // widget.modifierItems[index].nameList[0].localName,
                        NameHelper.currentName(widget.modifierItems[index].nameList),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: _isSelected(widget.modifierItems[index].id, cart) ? Colors.white : null
                        ),
                      )
                    ),
                  ),
                ),
              ),
            )
        );
      }
    );
  }
}