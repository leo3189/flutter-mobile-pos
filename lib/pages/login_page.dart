import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_mobile_pos/helpers/diolog_helper.dart';
import 'package:flutter_mobile_pos/helpers/sp_helper.dart';
import 'package:flutter_mobile_pos/models/login_dto.dart';
import 'package:flutter_mobile_pos/models/login_response.dart';
import 'package:flutter_mobile_pos/services/api_service.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _api = ApiService();
  LoginDto _loginDto = new LoginDto();

  @override
  void initState() {
    super.initState();
  }

  Future<void> _login() async {
    try {
      Map<String, String> loginDto = {
        'username': _loginDto.userName,
        'passcode': _loginDto.passcode
      };
      var response = await _api.loginApi().login(loginDto);
      var result = LoginResponse.fromJson(response.data);
      if (result.code != 0) {
        
      } else {
        if (result.data == null) {

        } else {
          DialogHelper.show(
            context,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                BranchList(
                  branches: result.data.user.branches,
                  companyId: result.data.user.companyId,
                  token: result.data.token,
                )
              ],
            )
          );
        }
      }
    } on Exception {

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child:  Container(
            alignment: AlignmentDirectional.center,
            // width: double.infinity,
            // height: ScreenUtil().screenHeight / 2,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(.5),
                        Colors.black.withOpacity(.5)
                      ]
                    )
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white
                          ),
                          width: ScreenUtil().setWidth(420 * 2),
                          height: ScreenUtil().setHeight(64 * 2),
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                top: ScreenUtil().setHeight(15 * 2),
                                right: ScreenUtil().setSp(15 * 2)
                              ),
                              icon: Padding(
                                padding: EdgeInsets.only(
                                  left: ScreenUtil().setWidth(18 * 2),
                                  top: ScreenUtil().setHeight(15 * 2)
                                ),
                                child: Icon(
                                  Icons.email,
                                  size: ScreenUtil().setSp(20 * 2),
                                ),
                              ),
                              hintText: 'Username / Email',
                              hintStyle: TextStyle(
                                fontSize: ScreenUtil().setSp(16 * 2),
                              ),
                              border: InputBorder.none
                            ),
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(48)
                            ),
                            onSaved: (value) {
                              _loginDto.userName = value;
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Username can not be null';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(12 * 2),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white
                          ),
                          width: ScreenUtil().setWidth(420 * 2),
                          height: ScreenUtil().setHeight(64 * 2),
                          child: TextFormField(
                            obscureText: true,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                top: ScreenUtil().setHeight(15 * 2),
                                right: ScreenUtil().setSp(90)
                              ),
                              icon: Padding(
                                padding: EdgeInsets.only(
                                  left: ScreenUtil().setWidth(18 * 2),
                                  top: ScreenUtil().setHeight(15 * 2)
                                ),
                                child: Icon(
                                  Icons.vpn_key,
                                  size: ScreenUtil().setSp(20 * 2),
                                ),
                              ),
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                fontSize: ScreenUtil().setSp(16 * 2)
                              ),
                              border: InputBorder.none
                            ),
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(48)
                            ),
                            onSaved: (value) {
                              _loginDto.passcode = value;
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Password can not be null';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(24 * 2),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();
                              _login();
                            }
                          }, 
                          child: Text('Login')
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ),
        )
      )
    );
  }
}

class BranchList extends StatelessWidget {
  final List<Branch> branches;
  final String companyId;
  final String token;

  BranchList({
    Key key,
    this.branches,
    this.companyId,
    this.token
  }): super(key: key);

  Future<void> _selectBranch(Branch branch, BuildContext context) async {
    SpHelper.putString('companyId', companyId);
    SpHelper.putString('branchId', branch.id);
    SpHelper.putObject('branch', branch);
    SpHelper.putBool('isLogin', true);
    Navigator.pushNamed(context, '/loadData');
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 20.0,
      clipBehavior: Clip.antiAlias,
      semanticContainer: false,
      child: Container(
        height: ScreenUtil().setHeight(89 * 2) * (branches.length < 5 ? branches.length : 5) +
          ScreenUtil().setHeight(48 * 2),
        width: ScreenUtil().setWidth(420 * 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: ScreenUtil().setHeight(48 * 2),
              width: ScreenUtil().setWidth(420 * 2),
              color: Theme.of(context).primaryColor,
              child: Center(
                child: Text(
                  'Please select a branch',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(17 * 2),
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            Container(
              height: ScreenUtil().setHeight(89 * 2) * (branches.length < 5 ? branches.length : 5),
              child: ListView.builder(
                itemCount: branches.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 0.5,
                            color: Colors.grey
                          )
                        )
                      ),
                      height: ScreenUtil().setHeight(88 * 2),
                      child: Center(
                        child: Text(
                          branches[index].name,
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(17 * 2),
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ),
                    ),
                    onTap: () => _selectBranch(branches[index], context),
                  );
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}