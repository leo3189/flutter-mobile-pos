import 'package:flutter/cupertino.dart';
import 'package:flutter_mobile_pos/models/invoice.dart';
import 'package:flutter_mobile_pos/models/invoice_paymentList.dart';
import 'package:flutter_mobile_pos/models/order.dart';
import 'package:flutter_mobile_pos/models/order_invoice.dart';

class PaymentProvider extends ChangeNotifier {

  bool canPay = false;
  Order currentOrder;
  List<Invoice> invoiceList;
  Invoice originalInvoice;
  bool invoiceModified;

  Invoice _invoice;
  Invoice get currentInvoice => _invoice;
  set currentInvoice(Invoice newInvoice) {
    assert(newInvoice != null);
    _invoice = newInvoice;
  }

  double _amountDue;
  double get amountDue => _amountDue;
  set amountDue(double value) {
    assert(value != null);
    _amountDue = value;
  }

  bool _showCompletePaymentModal = false;
  bool get showCompletePaymentModal => _showCompletePaymentModal;
  set showCompletePaymentModal(bool value) {
    assert(value != null);
    _showCompletePaymentModal = value;
  }

  void init(Order order) {
    this.invoiceList = [];
    order.calculateTotals();
    canPay = true;
    if (order.orderStatus == OrderStatus.CLOSED || order.orderStatus == OrderStatus.VOID) canPay = false;

    currentOrder = order;

    _validateOrderInvoices();
  }

  void _validateOrderInvoices() {
    if (invoiceList.length < 1) {
      originalInvoice = Invoice.init(currentOrder);
      currentInvoice = originalInvoice;
      invoiceList.add(currentInvoice);
      currentInvoice.calculateTotals();
      currentInvoice.calculatePaymentTotals();
    }
  }

  void payBy() {
    return null;
  }

  void completePayment({double inputPayAmount}) {
    currentInvoice.makePayment(PaymentType.CASH, inputPayAmount);
    amountDue = currentInvoice.getAmountDue();
    _finalizePayment();
  }

  void _finalizePayment() {
    invoiceModified = true;
    amountDue = currentInvoice.getAmountDue();
    if (currentInvoice.status == InvoiceStatus.PAID || currentInvoice.status == InvoiceStatus.DEPOSIT) {
      completeOrder();
    }
  }

  void completeOrder() {
    if (saveInvoice()) {
      currentInvoice.saveInvoice();
      showCompletePaymentModal = true;
    }
    notifyListeners();
  }

  bool saveInvoice() {
    bool isSuccessful = false;

    OrderInvoice orderInvoice = new OrderInvoice.init(currentOrder, invoiceList);

    if (areInvoicesClosed()) {
      if (currentOrder.closeOrder(invoiceList)) {
        isSuccessful = orderInvoice.save();

        if (isSuccessful) {

        } else {
          this.currentInvoice.status = InvoiceStatus.OPEN;
        }
      }
    } else {
      isSuccessful = orderInvoice.save();
    }
    return isSuccessful;
  }

  bool areInvoicesClosed() {
    var response = invoiceList.where((f) => f.status == InvoiceStatus.OPEN || f.status == InvoiceStatus.AFTER_DEPOSIT).toList();
    if (response.length > 0) {
      return false;
    } else {
      return true;
    }
  }

  void hideCompletePaymentModal() {
    showCompletePaymentModal = false;
  }
}