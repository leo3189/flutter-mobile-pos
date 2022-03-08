import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobile_pos/helpers/diolog_helper.dart';
import 'package:flutter_mobile_pos/helpers/print_helper.dart';
import 'package:flutter_mobile_pos/models/invoice.dart';
import 'package:flutter_mobile_pos/models/order.dart';
import 'package:flutter_mobile_pos/providers/cart_provider.dart';
import 'package:flutter_mobile_pos/providers/payment_provider.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  void initState() {
    super.initState();
    Order order = context.read<CartProvider>().order;
    Provider.of<PaymentProvider>(context, listen: false).init(order);
  }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(),
      body: Row(
        children: <Widget>[
          OrderPanel(),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              child: PaymentPanel()
            ) 
          )
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
  @override
  Widget build(BuildContext context) {
    var cart = context.watch<CartProvider>();

    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.all(5),
            itemCount: cart.shownOrderDetails.length,
            itemBuilder: (context, index) {
              return Table(
                columnWidths: {0: FractionColumnWidth(.15), 2: FractionColumnWidth(.15)},
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
                                cart.shownOrderDetails[index].name + (cart.shownOrderDetails[index].variantList.isNotEmpty
                                  ? " (" + cart.shownOrderDetails[index].variantList.first.variant.nameList.first.fullName + ")"
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
                                    modifier.modifierItem.nameList[0].localName + " \$" + modifier.totalAmt.toStringAsFixed(2),
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
                            "\$" + cart.shownOrderDetails[index].subtotalAmt.toStringAsFixed(2),
                            textAlign: TextAlign.right,
                          ),
                        )
                      )
                    ]
                  ),
                ],
              );
            }
          )
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
}

class PaymentPanel extends StatefulWidget {
  @override
  _PaymentPanelState createState() => _PaymentPanelState();
}

class _PaymentPanelState extends State<PaymentPanel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Center(
            child: Container(
              margin: EdgeInsets.only(top: 20, bottom: 20),
              width: 380,
              child: InputAmount(),
            )
          ) 
        ),
        Container(
          height: 80,
          decoration: BoxDecoration(color: Colors.grey),
        )
      ],
    );
  }
}

class InputAmount extends StatefulWidget {
  @override
  _InputAmountState createState() => _InputAmountState();
}

class _InputAmountState extends State<InputAmount> {
  var _controller;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  double payAmount;

  Future<void> _payCash() async {
    Provider.of<PaymentProvider>(context, listen: false).completePayment(
      inputPayAmount: _controller.numberValue
    );
  }

  void _numberOnChanged(String number) {
    if (number == 'delete' && _controller.text.isNotEmpty) {
      _controller.text = _controller.text.substring(0, _controller.text.length - 1);
      return;
    }
    _controller.text += number;
  }

  @override
  void initState() {
    super.initState();

    double payAmount = Provider.of<CartProvider>(context, listen: false).order.totalAmt;

    _controller = MoneyMaskedTextController(
      decimalSeparator: '.', 
      thousandSeparator: ',',
      leftSymbol: '\$ ',
      initialValue: payAmount
    );
  }

  @override
  Widget build(BuildContext context) {
    var cart = context.watch<CartProvider>();

    var payment = context.watch<PaymentProvider>();
    if (payment.showCompletePaymentModal) {
      Future.delayed(Duration.zero, () => 
        DialogHelper.show(
          context,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CompletePaymentView()],
          ),
          color: Colors.grey.withOpacity(.5)
        )
      );
    }

    return Column(
      children: <Widget>[
        Container(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Total:'),
                  Text('\$ ' + cart.total.toStringAsFixed(2))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Balance:'),
                  Text('\$ ' + cart.total.toStringAsFixed(2))
                ],
              )
            ],
          ),
        ),
        Form(
          key: _formKey,
          child: Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(width: 1.0, color: Theme.of(context).primaryColor),
            ),
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Tender Amount'),
                Expanded(
                  child: TextFormField(
                    controller: _controller,
                    readOnly: true,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      counterText: '',
                      border: InputBorder.none
                    ),
                  ) 
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              children: <Widget>[
                Container(
                  width: 110,
                  margin: EdgeInsets.only(right: 15),
                  child: TenderSelection()
                ),
                Flexible(
                  child: NumberPad(
                    numberOnChanged: _numberOnChanged
                  )
                )
              ],
            ),
          )
        ),
        Container(
          height: 60,
          child: ElevatedButton(
            onPressed: _payCash, 
            child: Center(
              child: Text('Pay Cash'),
            )
          ),
        )
      ],
    );
  }
}

class TenderSelection extends StatefulWidget {
  @override
  _TenderSelectionState createState() => _TenderSelectionState();
}

class _TenderSelectionState extends State<TenderSelection> {
  var tenders = ['20', '30', '40', '50', '100'];

  void _quickPay(String amount) {
    Provider.of<PaymentProvider>(context, listen: false).completePayment(
      inputPayAmount: double.parse(amount)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: tenders.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: 5),
            height: 54,
            child: ElevatedButton(
              onPressed: () => _quickPay(tenders[index]), 
              child: Center(
                child: Text('\$' + tenders[index]),
              )
            ),
          );
        }
      )
    );
  }
}

class NumberPad extends StatefulWidget {
  NumberPad({
    Key key,
    this.numberOnChanged
  });

  final ValueChanged<String> numberOnChanged;

  @override
  _NumberPadState createState() => _NumberPadState();
}

class _NumberPadState extends State<NumberPad> {
  var numbers = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];

  void _numberPressed(String number) {
    widget.numberOnChanged(number);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        crossAxisCount: 3,
        childAspectRatio: 1.2,
        children: <Widget>[
          ...numbers.map((e) => 
            ElevatedButton(
              onPressed: () => _numberPressed(e), 
              child: Center(
                child: Text(e),
              )
            )
          ).toList(),
          ElevatedButton(
            onPressed: () => _numberPressed('00'),
            child: Center(
              child: Text('00'),
            )
          ),
          ElevatedButton(
            onPressed: () => _numberPressed('0'),
            child: Center(
              child: Text('0'),
            )
          ),
          ElevatedButton(
            onPressed: () => _numberPressed('delete'),
            child: Center(
              child: Icon(
                Icons.backspace,
                size: ScreenUtil().setSp(80),
              ),
            )
          ),
        ],
      ),
    );
  }
}

class CompletePaymentView extends StatelessWidget {
  void _donePressed(context) {
    Navigator.of(context).pop();
    Navigator.pushNamed(context, '/home');
    Provider.of<PaymentProvider>(context, listen: false).hideCompletePaymentModal();
    Provider.of<CartProvider>(context, listen: false).clearCart();
  }

  void _printPressed(Invoice invoice) {
    PrintHelper().printSalesReceipt(invoice);
  }

  @override
  Widget build(BuildContext context) {
    var payment = context.watch<PaymentProvider>();

    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      color: Colors.white,
      elevation: 20.0,
      clipBehavior: Clip.antiAlias,
      semanticContainer: false,
      child: Container(
        padding: EdgeInsets.all(50),
        height: MediaQuery.of(context).size.height /2,
        width: MediaQuery.of(context).size.width / 2,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Total:'),
                Text('\$ ' + payment.currentInvoice.totalAmt.toStringAsFixed(2))
              ],
            ),
            Divider(
              color: Colors.black,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Paid:'),
                Text('\$ ' + payment.currentInvoice.paidAmt.toStringAsFixed(2))
              ],
            ),
            Divider(
              color: Colors.black,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Change:'),
                Text('\$ ' + payment.currentInvoice.changeAmt.toStringAsFixed(2))
              ],
            ),
            Divider(
              color: Colors.black,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Payment'),
                Text('Cash')
              ],
            ),
            SizedBox(
              height: ScreenUtil().setHeight(100)
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    child: Text('Print'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(50)
                    ),
                    onPressed: () => _printPressed(payment.currentInvoice),
                  )
                ),
                SizedBox(width: ScreenUtil().setWidth(50)),
                Expanded(
                  child: ElevatedButton(
                    child: Text('Done'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(50)
                    ),
                    onPressed: () => _donePressed(context),
                  )
                )
              ],
            )
          ],
        ),
      )
    );
  }
}