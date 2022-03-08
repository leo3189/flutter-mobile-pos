import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_mobile_pos/helpers/database_helper.dart';
import 'package:flutter_mobile_pos/helpers/sp_helper.dart';

class PosPin extends StatefulWidget {
  @override
  _PosPinState createState() => _PosPinState();
}

class _PosPinState extends State<PosPin> {
  TextEditingController _controller;

  void _numberOnChanged(String number) {
    _controller.text += number;
  }

  void _deleteNumber(bool delete) {
    if (_controller.text.isNotEmpty) {
      _controller.text = _controller.text.substring(0, _controller.text.length - 1);
    }
  }

  Future<void> _enterPressed() async {
    var staff = await DatabaseHelper.instance.findStaffByPosPin(_controller.text);
    if (staff == null) {
      _controller.clear();
    } else {
      SpHelper.putObject('staff', staff);
      SpHelper.putBool('posPin', true);
      Navigator.pop(context, true);
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(50),
      width: MediaQuery.of(context).size.width / 3,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: <Widget>[
          Text('Employee Pin Number'),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black87),
              borderRadius: BorderRadius.all(Radius.circular(50))
            ),
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: TextFormField(
              controller: _controller,
              readOnly: true,
              obscureText: true,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                counterText: '',
                border: InputBorder.none
              ),
            ),
          ),
          Expanded(
            child: NumberPad(
              numberOnChanged: _numberOnChanged,
              deleteOnChanged: _deleteNumber,
            )
          ),
          Container(
            height: 60,
            child: ElevatedButton(
              onPressed: _enterPressed, 
              child: Center(
                child: Text('Enter'),
              )
            ),
          )
        ],
      ),
    );
  }
}

class NumberPad extends StatefulWidget {
  NumberPad({
    Key key,
    this.numberOnChanged,
    this.deleteOnChanged
  });

  final ValueChanged<String> numberOnChanged;
  final ValueChanged<bool> deleteOnChanged;

  @override
  _NumberPadState createState() => _NumberPadState();
}

class _NumberPadState extends State<NumberPad> {
  var numbers = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];

  void _numberPressed(String number) {
    widget.numberOnChanged(number);
  }

  void _deletePressed() {
    widget.deleteOnChanged(true);
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
            onPressed: () => _deletePressed(),
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