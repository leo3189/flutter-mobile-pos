import 'dart:io';
import 'dart:typed_data';

import 'package:esc_pos_printer/esc_pos_printer.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_mobile_pos/helpers/database_helper.dart';
import 'package:flutter_mobile_pos/helpers/sp_helper.dart';
import 'package:flutter_mobile_pos/models/branch_info.dart';
import 'package:flutter_mobile_pos/models/invoice.dart';
import 'package:flutter_mobile_pos/models/order.dart';
import 'package:flutter_mobile_pos/models/printer.dart';
import 'package:flutter_mobile_pos/models/virtual_receipt.dart';

class PrintHelper {
  
  printSalesReceipt(Invoice invoice) async {
    var printerIP = '192.168.86.154';
    const PaperSize paper = PaperSize.mm80;
    final profile = await CapabilityProfile.load();
    final printer = NetworkPrinter(paper, profile);
    List<Printer> printers = await DatabaseHelper.instance.getPrinters();
    var salesPrinter = printers.firstWhere((w) => w.virtualReceipt.receiptTypeID == ReceiptType.SALE);

    final PosPrintResult res = await printer.connect(printerIP, port: 9100);
    if (res == PosPrintResult.success) {
      await _salesReceipt(printer, invoice, salesPrinter);
      printer.disconnect();
    }
  }

  Future<void> _salesReceipt(NetworkPrinter printer, Invoice invoice, Printer salesPrinter) async {
    // Print image
    // final ByteData data = await rootBundle.load('assets/rabbit_black.jpg');
    // final Uint8List bytes = data.buffer.asUint8List();
    // final Image image = decodeImage(bytes);
    // printer.image(image);
    
    printer.text('# ${invoice.invoiceNum}',
      styles: PosStyles(
        align: PosAlign.center,
        height: PosTextSize.size3,
        width: PosTextSize.size3
      ),
    );

    printer.text(OrderType.fromId(invoice.orderTypeID),
      styles: PosStyles(
        align: PosAlign.center,
        height: PosTextSize.size2,
        width: PosTextSize.size2
      ),
      linesAfter: 1
    );

    BranchInfo branch = await DatabaseHelper.instance.getBranchById(SpHelper.getString('branchId'));

    printer.text(branch.name,
      styles: PosStyles(
        align: PosAlign.center,
        height: PosTextSize.size2,
        width: PosTextSize.size2,
      ),
      linesAfter: 1
    );
    printer.text(branch.street, 
      styles: PosStyles(align: PosAlign.center)
    );
    printer.text('${branch.city}, ${branch.state} ${branch.zip}',
      styles: PosStyles(align: PosAlign.center)
    );
    printer.text('Tel: ${branch.phone}',
      styles: PosStyles(align: PosAlign.center),
      linesAfter: 1
    );

    printer.row([
      PosColumn(
        text: DateFormat('MM/dd/yyyy H:m').format(DateTime.parse(invoice.invoiceTime)),
        width: 4,
        styles: PosStyles(align: PosAlign.left)
      ),
      PosColumn(
        text: 'Terminal ${invoice.terminal}',
        width: 4,
        styles: PosStyles(align: PosAlign.center)
      ),
      PosColumn(
        text: invoice.staff.nickName,
        width: 4,
        styles: PosStyles(align: PosAlign.right)
      )
    ]);

    printer.hr();

    for (var order in invoice.detailsList) {
      var detailList = await DatabaseHelper.instance.getOrderDetailByInvoice(invoice.orderID, order.orderDetailsId);
      print(detailList);
      printer.row([
        PosColumn(
          text: detailList.qty.toString(), 
          width: 1
        ),
        PosColumn(
          text: detailList.name, 
          width: 7, 
          containsChinese: true,
          styles: PosStyles(
            bold: true
          )
        ),
        PosColumn(
          text: '\$' + detailList.totalAmt.toStringAsFixed(2), 
          width: 4, 
          styles: PosStyles(align: PosAlign.right)
        ),
      ]);
    }

    printer.hr();

    printer.row([
      PosColumn(
        text: 'Subtotal',
        width: 8,
        styles: PosStyles(
          align: PosAlign.right,
        )
      ),
      PosColumn(
        text: '\$' + invoice.subTotalAmt.toStringAsFixed(2),
        width: 4,
        styles: PosStyles(
          align: PosAlign.right,
        )
      ),
    ]);

     printer.row([
      PosColumn(
        text: 'Tax',
        width: 8,
        styles: PosStyles(
          align: PosAlign.right,
        )
      ),
      PosColumn(
        text: '\$' + invoice.totalTaxAmt.toStringAsFixed(2),
        width: 4,
        styles: PosStyles(
          align: PosAlign.right,
        )
      ),
    ]);

     printer.row([
      PosColumn(
        text: 'Total',
        width: 8,
        styles: PosStyles(
          bold: true,
          align: PosAlign.right,
          width: PosTextSize.size2
        )
      ),
      PosColumn(
        text: '\$' + invoice.totalAmt.toStringAsFixed(2),
        width: 4,
         styles: PosStyles(
          bold: true,
          align: PosAlign.right,
          width: PosTextSize.size2
        )
      ),
    ]);

    printer.hr(linesAfter: 1);

    printer.row([
      PosColumn(
        text: 'Cash',
        width: 8,
        styles: PosStyles(
          align: PosAlign.right,
          width: PosTextSize.size2
        )
      ),
      PosColumn(
          text: '\$' + invoice.paidAmt.toStringAsFixed(2),
          width: 4,
          styles: PosStyles(
            align: PosAlign.right, 
            width: PosTextSize.size2
          )
        ),
    ]);

    printer.row([
      PosColumn(
        text: 'Change',
        width: 8,
        styles: PosStyles(
          align: PosAlign.right, 
          width: PosTextSize.size2
        )
      ),
      PosColumn(
        text: '\$' + invoice.changeAmt.toStringAsFixed(2),
        width: 4,
        styles: PosStyles(
          align: PosAlign.right, 
          width: PosTextSize.size2
        )
      ),
    ]);

    printer.feed(2);
    printer.text('Thank you!',
      styles: PosStyles(
        align: PosAlign.center, 
        bold: true
      )
    );

    // Print QR Code from image
    // try {
    //   const String qrData = 'example.com';
    //   const double qrSize = 200;
    //   final uiImg = await QrPainter(
    //     data: qrData,
    //     version: QrVersions.auto,
    //     gapless: false,
    //   ).toImageData(qrSize);
    //   final dir = await getTemporaryDirectory();
    //   final pathName = '${dir.path}/qr_tmp.png';
    //   final qrFile = File(pathName);
    //   final imgFile = await qrFile.writeAsBytes(uiImg.buffer.asUint8List());
    //   final img = decodeImage(imgFile.readAsBytesSync());

    //   printer.image(img);
    // } catch (e) {
    //   print(e);
    // }

    // Print QR Code using native function
    // printer.qrcode('example.com');

    printer.feed(1);
    printer.cut();
  }
}