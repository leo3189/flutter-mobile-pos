import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_mobile_pos/helpers/sp_helper.dart';
import 'package:flutter_mobile_pos/models/order_detailList.dart';

part 'invoice_detailList.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 27)
class InvoiceDetailsList {
  @HiveField(0)
  String id;
  @HiveField(1)
  String orderDetailsId;
  @HiveField(2)
  String invoiceID;
  @HiveField(3)
  String companyID;
  @HiveField(4)
  String invoiceTime;
  @HiveField(5)
  String branchId;
  @HiveField(6)
  int menuItemID = 0;
  @HiveField(7)
  int qty = 0;
  @HiveField(8)
  double price = 0;
  @HiveField(9)
  double itemCost = 0;
  @HiveField(10)
  double taxAmt = 0;
  @HiveField(11)
  double totalDiscountAmt = 0;
  @HiveField(12)
  double subTotalAmt = 0;
  @HiveField(13)
  double totalAmt;
  @HiveField(14)
  String comment;
  @HiveField(15)
  bool isUsingDesignFee = false;
  @HiveField(16)
  double designFee = 0;
  @HiveField(17)
  int menuCategoryId = 0;
  @HiveField(18)
  int menuGroupId = 0;
  @HiveField(19)
  int salesCategoryId = 0;
  @HiveField(20)
  double weight = 0;
  @HiveField(21)
  int status = 0;
  @HiveField(22)
  List<InvoiceDetailsListModifierList> modifierList = [];
  @HiveField(23)
  List<InvoiceDetailsListDiscountList> discountList = [];
  @HiveField(24)
  List<InvoiceDetailsListTaxList> taxList = [];
  @HiveField(25)
  List<InvoiceDetailsListVariantList> variantList = [];
  @HiveField(26)
  List<InvoiceDetailsListPromotionList> promotionList = [];

  InvoiceDetailsList({
    this.id,
    this.orderDetailsId,
    this.invoiceID,
    this.companyID,
    this.invoiceTime,
    this.branchId,
    this.menuItemID,
    this.qty,
    this.price,
    this.itemCost,
    this.taxAmt,
    this.totalDiscountAmt,
    this.subTotalAmt,
    this.totalAmt,
    this.comment,
    this.isUsingDesignFee,
    this.designFee,
    this.menuCategoryId,
    this.menuGroupId,
    this.salesCategoryId,
    this.weight,
    this.status,
    this.modifierList,
    this.discountList,
    this.taxList,
    this.variantList,
    this.promotionList
  });

  factory InvoiceDetailsList.fromJson(Map<String, dynamic> json) => _$InvoiceDetailsListFromJson(json);
  Map<String, dynamic> toJson() => _$InvoiceDetailsListToJson(this);

  InvoiceDetailsList.init({ OrderDetailsList orderDetails, String invoiceId, String invoiceTime }) {
    this.id = Uuid().v1().toString().replaceAll('-', '');
    this.companyID = SpHelper.getString('companyId');
    this.branchId = SpHelper.getString('branchId');
    this.invoiceTime = invoiceTime;
    this.itemCost = orderDetails.itemCost;
    this.invoiceID = invoiceId;
    this.orderDetailsId = orderDetails.id;
    this.menuGroupId = orderDetails.menuGroupId;
    this.menuItemID = orderDetails.menuItemID;
    this.salesCategoryId = orderDetails.salesCategoryId;
    this.menuCategoryId = orderDetails.menuCategoryId;
    this.qty = orderDetails.qty;
    this.price = orderDetails.price;
    this.taxAmt = orderDetails.taxAmt;
    this.totalDiscountAmt = orderDetails.totalDiscountAmt;
    this.subTotalAmt = orderDetails.subtotalAmt;
    this.totalAmt = orderDetails.totalAmt;
    this.comment = orderDetails.comment;
    this.isUsingDesignFee = orderDetails.isUsingDesignFee;
    this.designFee = orderDetails.designFee;
    this.weight = orderDetails.weight;
    for (var modifier in orderDetails.modifierList) {
      InvoiceDetailsListModifierList list = new InvoiceDetailsListModifierList(
        id: Uuid().v1().toString().replaceAll('-', ''),
        invoiceDetailsID: this.id,
        modifierItemID: modifier.modifierItemID,
        qty: modifier.qty,
        totalAmt: modifier.totalAmt
      );
      this.modifierList.add(list);
    }

    for (var variant in orderDetails.variantList) {
      InvoiceDetailsListVariantList list = new InvoiceDetailsListVariantList(
        invoiceDetailsID: this.id, 
        variantID: variant.variantID
      );
      this.variantList.add(list);
    }

    for (var tax in orderDetails.taxList) {
      InvoiceDetailsListTaxList list = new InvoiceDetailsListTaxList(
        invoiceDetailsID: this.id,
        taxRate: tax.taxRate,
        taxID: tax.taxID,
        amt: tax.amt,
        name: tax.name
      );
      this.taxList.add(list);
    }

    for (var discount in orderDetails.discountList) {
      InvoiceDetailsListDiscountList list = new InvoiceDetailsListDiscountList(
        id: Uuid().v1().toString().replaceAll('-', ''),
        invoiceDetailsID: this.id,
        discountID: discount.discountID,
        discountBy: discount.discountBy,
        name: discount.name,
        rate: discount.rate,
        amt: discount.amt,
        isAmtDiscount: discount.isAmtDiscount
      );
      this.discountList.add(list);
    }

    for (var promotion in orderDetails.promotionList) {
      InvoiceDetailsListPromotionList list = new InvoiceDetailsListPromotionList(
        id: Uuid().v1().toString().replaceAll('-', ''),
        invoiceDetailsID: this.id,
        promotionID: promotion.promotionID,
        description: promotion.description,
        amt: promotion.amt
      );
    }

    calculateTotals();
  }

  void calculateTotals({bool isTaxExampt = false}) {
    double totalDiscountAmount = 0;
    double totalPromotionAmount = 0;
    for (var promotion in this.promotionList) {
      totalPromotionAmount += promotion.amt;
    }
    for (var discount in this.discountList) {
      if (!discount.isAmtDiscount) {
        discount.amt = discount.rate * this.subTotalAmt;
      }
      totalDiscountAmount += discount.amt;
    }
    totalDiscountAmount += totalPromotionAmount; 

    if (totalDiscountAmount > this.subTotalAmt) {
      totalDiscountAmount = this.subTotalAmt;
    }
    this.totalDiscountAmt = totalDiscountAmount;
    this.taxAmt = 0;

    if (!isTaxExampt) {
      for (var tax in this.taxList) {
        tax.calculuteAmount(this.subTotalAmt - this.totalDiscountAmt);
        this.taxAmt += tax.amt;
      }
    }
    this.totalAmt = this.taxAmt + this.subTotalAmt - this.totalDiscountAmt;
  }
}

@JsonSerializable()
@HiveType(typeId: 28)
class InvoiceDetailsListModifierList {
  @HiveField(0)
  String id;
  @HiveField(1)
  String invoiceDetailsID;
  @HiveField(2)
  int modifierItemID;
  @HiveField(3)
  int qty;
  @HiveField(4)
  double totalAmt;

  InvoiceDetailsListModifierList({
    this.id,
    this.invoiceDetailsID,
    this.modifierItemID,
    this.qty,
    this.totalAmt
  });

  factory InvoiceDetailsListModifierList.fromJson(Map<String, dynamic> json) => _$InvoiceDetailsListModifierListFromJson(json);
  Map<String, dynamic> toJson() => _$InvoiceDetailsListModifierListToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 29)
class InvoiceDetailsListDiscountList {
  @HiveField(0)
  String id;
  @HiveField(1)
  String invoiceDetailsID;
  @HiveField(2)
  int discountID;
  @HiveField(3)
  int discountBy;
  @HiveField(4)
  String name;
  @HiveField(5)
  double rate;
  @HiveField(6)
  double amt;
  @HiveField(7)
  bool isAmtDiscount;

  InvoiceDetailsListDiscountList({
    this.id,
    this.invoiceDetailsID,
    this.discountID,
    this.discountBy,
    this.name,
    this.rate,
    this.amt,
    this.isAmtDiscount
  });

  factory InvoiceDetailsListDiscountList.fromJson(Map<String, dynamic> json) => _$InvoiceDetailsListDiscountListFromJson(json);
  Map<String, dynamic> toJson() => _$InvoiceDetailsListDiscountListToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 30)
class InvoiceDetailsListTaxList {
  @HiveField(0)
  String invoiceDetailsID;
  @HiveField(1)
  int taxID;
  @HiveField(2)
  String name;
  @HiveField(3)
  double taxRate;
  @HiveField(4)
  double amt;

  InvoiceDetailsListTaxList({
    this.invoiceDetailsID,
    this.taxRate,
    this.taxID,
    this.amt,
    this.name
  });

  factory InvoiceDetailsListTaxList.fromJson(Map<String, dynamic> json) => _$InvoiceDetailsListTaxListFromJson(json);
  Map<String, dynamic> toJson() => _$InvoiceDetailsListTaxListToJson(this);

  void calculuteAmount(double orderAmount) {
    double rate = this.taxRate / 100;
    this.amt = orderAmount * rate;
  }
}

@JsonSerializable()
@HiveType(typeId: 31)
class InvoiceDetailsListVariantList {
  @HiveField(0)
  String invoiceDetailsID;
  @HiveField(1)
  int variantID;

  InvoiceDetailsListVariantList({
    this.invoiceDetailsID,
    this.variantID
  });

  factory InvoiceDetailsListVariantList.fromJson(Map<String, dynamic> json) => _$InvoiceDetailsListVariantListFromJson(json);
  Map<String, dynamic> toJson() => _$InvoiceDetailsListVariantListToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 32)
class InvoiceDetailsListPromotionList {
  @HiveField(0)
  String id;
  @HiveField(1)
  String invoiceDetailsID;
  @HiveField(2)
  int promotionID;
  @HiveField(3)
  String description;
  @HiveField(4)
  double amt;

  InvoiceDetailsListPromotionList({
    this.id,
    this.invoiceDetailsID,
    this.promotionID,
    this.description,
    this.amt
  });

  factory InvoiceDetailsListPromotionList.fromJson(Map<String, dynamic> json) => _$InvoiceDetailsListPromotionListFromJson(json);
  Map<String, dynamic> toJson() => _$InvoiceDetailsListPromotionListToJson(this);
}