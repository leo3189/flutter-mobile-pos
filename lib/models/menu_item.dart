import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:xpress_mobile_pos/models/menuItem_modifierGroup.dart';
import 'package:xpress_mobile_pos/models/menuItem_price.dart';
import 'package:xpress_mobile_pos/models/menuItem_printers.dart';
import 'package:xpress_mobile_pos/models/menuItem_promotion.dart';
import 'package:xpress_mobile_pos/models/menuItem_tax.dart';
import 'package:xpress_mobile_pos/models/menuItem_variantGroup.dart';
import 'package:xpress_mobile_pos/models/name_list.dart';

part 'menu_item.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 11)
class MenuItem {
  @HiveField(0)
  int id;
  @HiveField(1)
  String companyID;
  @HiveField(2)
  String branchID;
  @HiveField(3)
  bool isParent;
  @HiveField(4)
  int parentId;
  @HiveField(5)
  String notes;
  @HiveField(6)
  String description;
  @HiveField(7)
  bool onlineVisible;
  @HiveField(8)
  bool localVisible;
  @HiveField(9)
  bool isOpenItem;
  @HiveField(10)
  int orderIndex;
  @HiveField(11)
  int menuCategoryID;
  @HiveField(12)
  int salesCategoryID;
  @HiveField(13)
  int imageID;
  @HiveField(14)
  String colorCode;
  @HiveField(15)
  bool useScale;
  @HiveField(16)
  String unitType;
  @HiveField(17)
  double defaultPrice;
  @HiveField(18)
  bool isUsingNote;
  @HiveField(19)
  bool isUsingPickUpDate;
  @HiveField(20)
  bool isMultiPrice;
  @HiveField(21)
  bool isUsingDesignFee;
  @HiveField(22)
  String barcode;
  @HiveField(23)
  String sku;
  @HiveField(24)
  bool active;
  @HiveField(25)
  bool isDeleted;
  @HiveField(26)
  String inventoryType;  ///1 => Inventory Item, 2 => Composition Item
  @HiveField(27)
  bool isLinkedToCompostion;
  @HiveField(28)
  bool isForSelfOrder;
  @HiveField(29)
  bool isFullScreenModifiers;
  @HiveField(30)
  bool isOnlineOrder;
  @HiveField(31)
  List<NameList> nameList;
  @HiveField(32)
  List<MenuItemModifierGroup> modifierGroups;
  @HiveField(33)
  List<MenuItemPrinters> printers;
  @HiveField(34)
  List<MenuItemVariantGroup> variantGroups;
  @HiveField(35)
  List<MenuItemPromotion> promotionList;
  @HiveField(36)
  List<MenuItemPrice> priceList;
  @HiveField(37)
  List<MenuItemTax> taxes;

  MenuItem(
    this.id,
    this.companyID,
    this.branchID,
    this.isParent,
    this.parentId,
    this.notes,
    this.description,
    this.onlineVisible,
    this.localVisible,
    this.isOpenItem,
    this.orderIndex,
    this.menuCategoryID,
    this.salesCategoryID,
    this.imageID,
    this.colorCode,
    this.useScale,
    this.unitType,
    this.defaultPrice,
    this.isUsingNote,
    this.isUsingPickUpDate,
    this.isMultiPrice,
    this.isUsingDesignFee,
    this.barcode,
    this.sku,
    this.active,
    this.isDeleted,
    this.inventoryType,
    this.isLinkedToCompostion,
    this.isForSelfOrder,
    this.isFullScreenModifiers,
    this.isOnlineOrder,
    this.nameList,
    this.modifierGroups,
    this.printers,
    this.variantGroups,
    this.promotionList,
    this.priceList,
    this.taxes
  );

  factory MenuItem.fromJson(Map<String, dynamic> json) => _$MenuItemFromJson(json);
  Map<String, dynamic> toJson() => _$MenuItemToJson(this);
}