import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_mobile_pos/models/branch_info.dart';
import 'package:flutter_mobile_pos/models/daily_seq.dart';
import 'package:flutter_mobile_pos/models/invoice.dart';
import 'package:flutter_mobile_pos/models/invoice_detailList.dart';
import 'package:flutter_mobile_pos/models/invoice_paymentList.dart';
import 'package:flutter_mobile_pos/models/kitchen_receipt.dart';
import 'package:flutter_mobile_pos/models/label_format.dart';
import 'package:flutter_mobile_pos/models/menu.dart';
import 'package:flutter_mobile_pos/models/menuItem_modifierGroup.dart';
import 'package:flutter_mobile_pos/models/menuItem_price.dart';
import 'package:flutter_mobile_pos/models/menuItem_printers.dart';
import 'package:flutter_mobile_pos/models/menuItem_promotion.dart';
import 'package:flutter_mobile_pos/models/menuItem_tax.dart';
import 'package:flutter_mobile_pos/models/menuItem_variantGroup.dart';
import 'package:flutter_mobile_pos/models/menu_category.dart';
import 'package:flutter_mobile_pos/models/menu_item.dart';
import 'package:flutter_mobile_pos/models/menu_menuCategory.dart';
import 'package:flutter_mobile_pos/models/modifier_group.dart';
import 'package:flutter_mobile_pos/models/modifier_item.dart';
import 'package:flutter_mobile_pos/models/name_list.dart';
import 'package:flutter_mobile_pos/models/order.dart';
import 'package:flutter_mobile_pos/models/orderDetails_discountList.dart';
import 'package:flutter_mobile_pos/models/orderDetails_modifierList.dart';
import 'package:flutter_mobile_pos/models/orderDetails_promotionList.dart';
import 'package:flutter_mobile_pos/models/orderDetails_taxList.dart';
import 'package:flutter_mobile_pos/models/orderDetails_variantList.dart';
import 'package:flutter_mobile_pos/models/order_detailList.dart';
import 'package:flutter_mobile_pos/models/order_discountList.dart';
import 'package:flutter_mobile_pos/models/order_taxList.dart';
import 'package:flutter_mobile_pos/models/printer.dart';
import 'package:flutter_mobile_pos/models/printer_setting.dart';
import 'package:flutter_mobile_pos/models/sales_receipt.dart';
import 'package:flutter_mobile_pos/models/staff.dart';
import 'package:flutter_mobile_pos/models/staff_type.dart';
import 'package:flutter_mobile_pos/models/sync_data.dart';
import 'package:flutter_mobile_pos/models/taxes.dart';
import 'package:flutter_mobile_pos/models/variant_group.dart';
import 'package:flutter_mobile_pos/models/variant_list.dart';
import 'package:flutter_mobile_pos/models/virtual_receipt.dart';

class DatabaseHelper {
  DatabaseHelper._();
  static DatabaseHelper instance = DatabaseHelper._();
  Box<Menu> _menuBox;
  Box<MenuCategory> _menuCategoryBox;
  Box<MenuItem> _menuItemBox;
  Box<ModifierGroup> _modifierGroupBox;
  Box<Taxes> _taxesBox;
  Box<Order> _orderBox;
  Box<VariantGroup> _variantGroupBox;
  Box<Invoice> _invoiceBox;
  Box<DailySeq> _dailySeqBox;
  Box<SyncData> _syncDataBox;
  Box<Staff> _staffBox;
  Box<SalesReceipt> _salesReceiptBox;
  Box<SalesReceipt> _packerReceiptBox;
  Box<KitchenReceipt> _kitchenReceiptBox;
  Box<LabelFormat> _labelFormatBox;
  Box<VirtualReceipt> _virtualReceiptBox;
  Box<Printer> _printerBox;
  Box<PrinterSetting> _printerSettingBox;
  Box<BranchInfo> _branchInfoBox;
  
  Future init() async {
    var _directory = await getApplicationDocumentsDirectory();
    Hive
      ..init(_directory.path)
      ..registerAdapter(MenuAdapter())
      ..registerAdapter(NameListAdapter())
      ..registerAdapter(MenuMenuCategoryAdapter())
      ..registerAdapter(MenuCategoryAdapter())
      ..registerAdapter(MenuItemAdapter())
      ..registerAdapter(MenuItemModifierGroupAdapter())
      ..registerAdapter(MenuItemPriceAdapter())
      ..registerAdapter(MenuItemPrintersAdapter())
      ..registerAdapter(MenuItemPromotionAdapter())
      ..registerAdapter(MenuItemTaxAdapter())
      ..registerAdapter(MenuItemVariantGroupAdapter())
      ..registerAdapter(ModifierGroupAdapter())
      ..registerAdapter(ModifierItemAdapter())
      ..registerAdapter(OrderAdapter())
      ..registerAdapter(OrderTaxListAdapter())
      ..registerAdapter(OrderDiscountListAdapter())
      ..registerAdapter(OrderDetailsListAdapter())
      ..registerAdapter(OrderDetailsTaxListAdapter())
      ..registerAdapter(OrderDetailsDiscountListAdapter())
      ..registerAdapter(OrderDetailsModifierListAdapter())
      ..registerAdapter(OrderDetailsVariantListAdapter())
      ..registerAdapter(OrderDetailsPromotionListAdapter())
      ..registerAdapter(TaxesAdapter())
      ..registerAdapter(InvoiceAdapter())
      ..registerAdapter(InvoicePaymentListAdapter())
      ..registerAdapter(InvoiceDetailsListAdapter())
      ..registerAdapter(InvoiceDiscountListAdapter())
      ..registerAdapter(InvoiceTaxListAdapter())
      ..registerAdapter(PaymentListCreditCardTransactionsAdapter())
      ..registerAdapter(InvoiceDetailsListModifierListAdapter())
      ..registerAdapter(InvoiceDetailsListDiscountListAdapter())
      ..registerAdapter(InvoiceDetailsListTaxListAdapter())
      ..registerAdapter(InvoiceDetailsListVariantListAdapter())
      ..registerAdapter(InvoiceDetailsListPromotionListAdapter())
      ..registerAdapter(VariantGroupAdapter())
      ..registerAdapter(VariantGroupsNameListAdapter())
      ..registerAdapter(VariantListAdapter())
      ..registerAdapter(VariantListNameListAdapter())
      ..registerAdapter(DailySeqAdapter())
      ..registerAdapter(SyncDataAdapter())
      ..registerAdapter(StaffAdapter())
      ..registerAdapter(StaffPermissionListAdapter())
      ..registerAdapter(StaffAttendanceAdapter())
      ..registerAdapter(StaffShiftAdapter())
      ..registerAdapter(StaffShiftSettingAdapter())
      ..registerAdapter(StaffTypeAdapter())
      ..registerAdapter(SalesReceiptAdapter())
      ..registerAdapter(KitchenReceiptAdapter())
      ..registerAdapter(LabelFormatAdapter())
      ..registerAdapter(VirtualReceiptAdapter())
      ..registerAdapter(PrinterAdapter())
      ..registerAdapter(PrinterLanguageAdapter())
      ..registerAdapter(PrinterOrderTypeAdapter())
      ..registerAdapter(PrinterSettingAdapter())
      ..registerAdapter(BranchInfoAdapter())
      ..registerAdapter(OpenDaysAdapter())
      ..registerAdapter(AdImageAdapter());
  }

  Future<void> insertData(dynamic data) async {
    await insertMenu(data['menus']);
    await insertMenuCategory(data['menuCategories']);
    await insertMenuItem(data['menuItems']);
    await insertModifierGroup(data['modificationGroups']);
    await insertTaxes(data['taxes']);
    await insertVariantGroup(data['variantGroups']);
    await insertStaffs(data['staffs']);
    await insertSalesReceipt(data['salesReceipt']);
    await insertPackerReceipt(data['packerReceipt']);
    await insertLabelFormat(data['labelFormat']);
    await insertVirtualReceipt(data['virtualReceipts']);
    await insertPrinter(data['printers']);
    await insertPrinterSetting(data['printerSetting']);
    await insertBranchInfo(data['branches']);
  }

  Future<Box> get menuBox async {
    if (_menuBox != null) {
      return _menuBox;
    }
    _menuBox = await Hive.openBox<Menu>('menuBox');
    return _menuBox;
  }

  Future<void> insertMenu(data) async {
    await clearMenu();

    final box = await menuBox;
    for (var d in data) {
      var menu = Menu.fromJson(d);
      await box.put(menu.id, menu);
    }
  }

  Future clearMenu() async {
    final box = await menuBox;
    if (box.isNotEmpty) await box.clear();
  }

  Future<List<Menu>> getAllMenu() async {
    final box = await menuBox;
    return box.values.toList();
  }

  Future<Menu> getMenuById(int id) async {
    final box = await menuBox;
    return box.get(id);
  }

  Future<Box> get menuCategoryBox async {
    if (_menuCategoryBox != null) {
      return _menuCategoryBox;
    }
    _menuCategoryBox = await Hive.openBox<MenuCategory>('menuCategoryBox');
    return _menuCategoryBox;
  }

  Future<void> insertMenuCategory(data) async {
    await clearMenuCategory();

    final box = await menuCategoryBox;
    for (var d in data) {
      var menuCategory = MenuCategory.fromJson(d);
      await box.put(menuCategory.id, menuCategory);
    }
  }

  Future clearMenuCategory() async {
    final box = await menuCategoryBox;
    if (box.isNotEmpty) await box.clear();
  }

  Future<List<MenuCategory>> getAllMenuCategory() async {
    final box = await menuCategoryBox;
    return box.values.toList();
  }

  Future<MenuCategory> getMenuCategoryById(int id) async {
    final box = await menuCategoryBox;
    return box.get(id);
  }

  Future<List<MenuCategory>> getMenuCategoriesByMenuGroup(int id) async {
    var menuGroup = await getMenuById(id);

    List<int> catIds = [];
    menuGroup.menuCategories.forEach((e) => {
      catIds.add(e.menuCategoryID)
    });

    List<MenuCategory> menuCategories = [];
    for (var c in catIds) {
      var cat = await getMenuCategoryById(c);
      menuCategories.add(cat);
    }
    
    return menuCategories;
  }

  Future<Box> get menuItemBox async {
    if (_menuItemBox != null) return _menuItemBox;
    
    _menuItemBox = await Hive.openBox<MenuItem>('menuItemBox');
    return _menuItemBox;
  }

  Future<void> insertMenuItem(data) async {
    await clearMenuItem();

    final box = await menuItemBox;
    for (var d in data) {
      var menuItem = MenuItem.fromJson(d);
      await box.put(menuItem.id, menuItem);
    }
  }

  Future clearMenuItem() async {
    final box = await menuItemBox;
    if (box.isNotEmpty) await box.clear();
  }

  Future<List<MenuItem>> getMenuItemsByCategoryId(int id) async {
    final box = await menuItemBox;
    List<MenuItem> menuItems = box.values.toList();
    menuItems.forEach((e) {
      e.taxes.forEach((element) async {
        element.tax = await getTaxById(element.taxId);
      });

      e.modifierGroups.forEach((element) async {
        element.modifierGroup = await getModifierGroupById(element.modifierGroupID);
      });
    });
    return menuItems.where((w) => w.menuCategoryID == id && w.active).toList();
  }

  Future<MenuItem> getMenuItemById(int id) async {
    final box = await menuItemBox;
    return box.get(id);
  }

  Future<Box> get modifierGroupBox async {
    if (_modifierGroupBox != null) return _modifierGroupBox;

    _modifierGroupBox = await Hive.openBox<ModifierGroup>('modifierGroupBox');
    return _modifierGroupBox;
  }

  Future<void> insertModifierGroup(data) async {
    await clearModifierGroup();

    final box = await modifierGroupBox;
    for (var d in data) {
      var modifierGroup = ModifierGroup.fromJson(d);
      await box.put(modifierGroup.id, modifierGroup);
    }
  }

  Future<void> clearModifierGroup() async {
    final box = await modifierGroupBox;
    if (box.isNotEmpty) await box.clear();
  }

  Future<List<ModifierGroup>> getModifierGroupsByMenuItem(int id) async {
    var menuItem = await getMenuItemById(id);

    List<int> modifierGroupIds = [];
    menuItem.modifierGroups.forEach((e) { 
      modifierGroupIds.add(e.modifierGroupID);
    });

    List<ModifierGroup> modifierGroups = [];
    for (var m in modifierGroupIds) {
      var modifierGroup = await getModifierGroupById(m);
      modifierGroup.modifierItems.forEach((e) { e.modifierGroup = modifierGroup; });
      modifierGroups.add(modifierGroup);
    }

    return modifierGroups;
  }

  Future<ModifierGroup> getModifierGroupById(int id) async {
    final box = await modifierGroupBox;
    return box.get(id);
  }

  Future<Box> get taxesBox async {
    if (_taxesBox != null) return _taxesBox;
    _taxesBox = await Hive.openBox<Taxes>('taxesBox');
    return _taxesBox;
  }

  Future<void> insertTaxes(data) async {
    await clearTaxes();

    final box = await taxesBox;
    for (var d in data) {
      var tax = Taxes.fromJson(d);
      await box.put(tax.id, tax);
    }
  }

  Future<void> clearTaxes() async {
    final box = await taxesBox;
    if (box.isNotEmpty) await box.clear();
  }

  Future<Taxes> getTaxById(int id) async {
    final box = await taxesBox;
    return box.get(id);
  }

  Future<Box> get orderBox async {
    if (_orderBox != null) return _orderBox;
    _orderBox = await Hive.openBox<Order>('orderBox');
    return _orderBox;
  }

  Future<bool> insertOrder(data) async {
    try {
      final box = await orderBox;
      var order = Order.fromJson(data);
      print('insert order: $order');
      await box.put(order.id, order);
      return true;
    } catch (error) {
      return false;
    }
  }

  Future<List<Order>> getOrders() async {
    final box = await orderBox;
    return box.values.toList();
  }

  Future<Order> getOrderById(String id) async {
    final box = await orderBox;
    return box.get(id);
  }

  Future<OrderDetailsList> getOrderDetailByInvoice(String orderId, String orderDetailId) async {
    final box = await orderBox;
    Order order = box.get(orderId);
    OrderDetailsList detailsList = order.detailsList.firstWhere((f) => f.id == orderDetailId);
    return detailsList;
  }

  Future<Box> get variantGroupBox async {
    if (_variantGroupBox != null) return _variantGroupBox;
    _variantGroupBox = await Hive.openBox<VariantGroup>('variantGroup');
    return _variantGroupBox;
  }

  Future<void> insertVariantGroup(data) async {
    await clearVariantGroup();

    final box = await variantGroupBox;
    for (var d in data) {
      var variantGroup = VariantGroup.fromJson(d);
      await box.put(variantGroup.id, variantGroup);
    }
  }

  Future<void> clearVariantGroup() async {
    final box = await variantGroupBox;
    if (box.isNotEmpty) await box.clear();
  }

  Future<List<VariantGroup>> getVariantGroupsByMenuItem(int id) async {
    var menuItem = await getMenuItemById(id);

    List<int> variantGroupIds = [];
    menuItem.variantGroups.forEach((e) { 
      variantGroupIds.add(e.variantGroupID);
    });

    List<VariantGroup> variantGroups = [];
    for (var v in variantGroupIds) {
      var variantGroup = await getVariantGroupById(v);
      variantGroups.add(variantGroup);
    }

    return variantGroups;
  }

  Future<VariantGroup> getVariantGroupById(int id) async {
    final box = await variantGroupBox;
    return box.get(id);
  }

  Future<Box> get invoiceBox async {
    if (_invoiceBox != null) return _invoiceBox;
    _invoiceBox = await Hive.openBox<Invoice>('invoice');
    return _invoiceBox;
  }

  Future<bool> insertInvoice(data) async {
     try {
      final box = await invoiceBox;
      var invoice = Invoice.fromJson(data);
      await box.put(invoice.id, invoice);
      return true;
    } catch (error) {
      return false;
    }
  }

  Future<Invoice> getInvoiceById(String id) async {
    final box = await invoiceBox;
    return box.get(id);
  }

  Future<Box> get dailySeqBox async {
    if (_dailySeqBox != null) return _dailySeqBox;
    _dailySeqBox = await Hive.openBox<DailySeq>('dailySeq');
    return _dailySeqBox;
  }

  Future insertDailySeq(data) async {
    final box = await dailySeqBox;
    var dailySeq = DailySeq.fromJson(data);
    await box.put(1, dailySeq);
  }

  Future<List<DailySeq>> getDailySeq() async {
    final box = await dailySeqBox;
    return box.values.toList();
  }

  Future<Box> get syncDataBox async {
    if (_syncDataBox != null) return _syncDataBox;
    _syncDataBox = await Hive.openBox<SyncData>('syncData');
    return _syncDataBox;
  }

  Future<bool> insertSyncData(data) async {
    try {
      final box = await syncDataBox;
      var syncData = SyncData.fromJson(data);
      await box.put(syncData.id, syncData);
      return true;
    } catch (error) {
      return false;
    }
  }

  Future<Box> get staffBox async {
    if (_staffBox != null) return _staffBox;
    _staffBox = await Hive.openBox<Staff>('staff');
    return _staffBox;
  }

  Future insertStaffs(data) async {
    await clearStaff();

    final box = await staffBox;
    for (var d in data) {
      var staff = Staff.fromJson(d);
      await box.put(staff.id, staff);
    }
  }

  Future<void> clearStaff() async {
    final box = await staffBox;
    if (box.isNotEmpty) await box.clear();
  }

  Future<Staff> findStaffByPosPin(String pin) async {
    final box = await staffBox;
    List<Staff> staffs = box.values.toList();
    var staff = staffs.firstWhere((f) => f.posPin == pin, orElse: () => null);
    return staff;
  }

  Future<Box> get salesReceiptBox async {
    if (_salesReceiptBox != null) return _salesReceiptBox;
    _salesReceiptBox = await Hive.openBox<SalesReceipt>('salesReceipt');
    return _salesReceiptBox;
  }

  Future insertSalesReceipt(data) async {
    await clearSalesReceipt();

    final box = await salesReceiptBox;
    for (var d in data) {
      var salesReceipt = SalesReceipt.fromJson(d);
      await box.put(salesReceipt.id, salesReceipt);
    }
  }

  Future clearSalesReceipt() async {
    final box = await salesReceiptBox;
    if (box.isNotEmpty) await box.clear();
  }

  Future<SalesReceipt> getSalesReceiptById(String id) async {
    final box = await salesReceiptBox;
    return box.get(id);
  }

  Future<Box> get packerReceiptBox async {
    if (_packerReceiptBox != null) return _packerReceiptBox;
    _packerReceiptBox = await Hive.openBox<SalesReceipt>('packerReceipt');
    return _packerReceiptBox;
  }

  Future insertPackerReceipt(data) async {
    await clearPackerReceipt();

    final box = await packerReceiptBox;
    for (var d in data) {
      var packerReceipt = SalesReceipt.fromJson(d);
      await box.put(packerReceipt.id, packerReceipt);
    }
  }

  Future clearPackerReceipt() async {
    final box = await packerReceiptBox;
    if (box.isNotEmpty) await box.clear();
  }

  Future<SalesReceipt> getPackerReceiptById(String id) async {
    final box = await packerReceiptBox;
    return box.get(id);
  }

  Future<Box> get kitchenReceiptBox async {
    if (_kitchenReceiptBox != null) return _kitchenReceiptBox;
    _kitchenReceiptBox = await Hive.openBox<KitchenReceipt>('kitchenReceipt');
    return _kitchenReceiptBox;
  }

  Future insertKitchenReceipt(data) async {
    await clearKitchenReceipt();

    final box = await kitchenReceiptBox;
    for (var d in data) {
      var kitchenReceipt = KitchenReceipt.fromJson(d);
      await box.put(kitchenReceipt.id, kitchenReceipt);
    }
  }

  Future clearKitchenReceipt() async {
    final box = await kitchenReceiptBox;
    if (box.isNotEmpty) await box.clear();
  }

  Future<KitchenReceipt> getKitchenReceiptById(String id) async {
    final box = await kitchenReceiptBox;
    return box.get(id);
  }

  Future<Box> get labelFormatBox async {
    if (_labelFormatBox != null) return _labelFormatBox;
    _labelFormatBox = await Hive.openBox<LabelFormat>('labelFormat');
    return _labelFormatBox;
  }

  Future insertLabelFormat(data) async {
    await clearLabelFormat();

    final box = await labelFormatBox;
    for (var d in data) {
      var labelFormat = LabelFormat.fromJson(d);
      await box.put(labelFormat.id, labelFormat);
    }
  }

  Future clearLabelFormat() async {
    final box = await labelFormatBox;
    if (box.isNotEmpty) await box.clear();
  }

  Future<LabelFormat> getLabelFormatById(String id) async {
    final box = await labelFormatBox;
    return box.get(id);
  }

  Future<Box> get virtualReceiptBox async {
    if (_virtualReceiptBox != null) return _virtualReceiptBox;
    _virtualReceiptBox = await Hive.openBox<VirtualReceipt>('virtualReceipt');
    return _virtualReceiptBox;
  }

  Future insertVirtualReceipt(data) async {
    await clearVirtualReceipt();

    final box = await virtualReceiptBox;
    for (var d in data) {
      var virtualReceipt = VirtualReceipt.fromJson(d);
      await box.put(virtualReceipt.id, virtualReceipt);
    }
  }

  Future clearVirtualReceipt() async {
    final box = await virtualReceiptBox;
    if (box.isNotEmpty) box.clear();
  }

  Future<VirtualReceipt> getVirtualReceiptById(String id) async {
    final box = await virtualReceiptBox;
    VirtualReceipt virtualReceipt = await box.get(id);
    if (virtualReceipt.salesReceiptID != null) {
      virtualReceipt.salesReceipt = await getSalesReceiptById(virtualReceipt.salesReceiptID);
    }
    if (virtualReceipt.kitchenReceiptID != null) {
      virtualReceipt.kitchenReceipt = await getKitchenReceiptById(virtualReceipt.kitchenReceiptID);
    }
    if (virtualReceipt.labelFormatID != null) {
      virtualReceipt.labelFormat = await getLabelFormatById(virtualReceipt.labelFormatID);
    }
    if (virtualReceipt.parkerReceiptID != null) {
      virtualReceipt.packerReceipt = await getPackerReceiptById(virtualReceipt.parkerReceiptID);
    }
    return virtualReceipt;
  }

  Future<Box> get printerBox async {
    if (_printerBox != null) return _printerBox;
    _printerBox = await Hive.openBox<Printer>('printer');
    return _printerBox;
  }

  Future insertPrinter(data) async {
    await clearPrinter();

    final box = await printerBox;
    for (var d in data) {
      var printer = Printer.fromJson(d);
      await box.put(printer.id, printer);
    }
  }

  Future clearPrinter() async {
    final box = await printerBox;
    if (box.isNotEmpty) await box.clear();
  }

  Future<List<Printer>> getPrinters() async {
    final box = await printerBox;
    List<Printer> printers = box.values.toList();
    printers.forEach((e) async { 
      e.virtualReceipt = await getVirtualReceiptById(e.virtualReceiptID);
    });
    return printers;
  }

  Future<Box> get printerSettingBox async {
    if (_printerSettingBox != null) return _printerSettingBox;
    _printerSettingBox = await Hive.openBox<PrinterSetting>('printerSetting');
    return _printerSettingBox;
  }

  Future insertPrinterSetting(data) async {
    await clearPrinterSetting();

    final box = await printerSettingBox;
    var printeSetting = PrinterSetting.fromJson(data);
    await box.put(printeSetting.branchID, printeSetting);
  }

  Future clearPrinterSetting() async {
    final box = await printerSettingBox;
    if (box.isNotEmpty) await box.clear();
  }

  Future<Box> get branchInfoBox async {
    if (_branchInfoBox != null) return _branchInfoBox;
    _branchInfoBox = await Hive.openBox<BranchInfo>('branchInfo');
    return _branchInfoBox;
  }

  Future insertBranchInfo(data) async {
    await clearBranchInfo();

    final box = await branchInfoBox;
    for (var d in data) {
      var branchInfo = BranchInfo.fromJson(d);
      await box.put(branchInfo.id, branchInfo);
    }
  }

  Future clearBranchInfo() async {
    var box = await branchInfoBox;
    if (box.isNotEmpty) await box.clear();
  }

  Future<BranchInfo> getBranchById(String id) async {
    final box = await branchInfoBox;
    return box.get(id);
  }
}