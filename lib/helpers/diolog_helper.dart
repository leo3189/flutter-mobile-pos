import 'package:flutter/material.dart';

class DialogHelper {
  static show(BuildContext context, Widget child, {Color color}) {
    showGeneralDialog(
      transitionBuilder: (context, a1, a2, widget) {
        final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
        return Transform(
          transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
          child: Opacity(opacity: a1.value, child: child),
        );
      },
      transitionDuration: Duration(milliseconds: 200),
      barrierDismissible: false,
      barrierLabel: '',
      barrierColor: color,
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return null;
      }
    );
  }
}