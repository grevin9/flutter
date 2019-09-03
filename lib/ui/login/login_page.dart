import 'package:flutter/material.dart';
import 'package:flutter_app/common/database/database_login.dart';
import 'package:flutter_app/common/shared_preferences/session.dart';
import 'package:flutter_app/common/widget/button.dart';
import 'package:flutter_app/common/colors.dart';
import 'package:flutter_app/common/sizes.dart';
import 'package:flutter_app/common/widget/button_facebook.dart';
import 'package:flutter_app/common/widget/button_google.dart';
import 'package:flutter_app/common/validation/validation_login.dart';
import 'package:flutter_app/ui/login/forgot_password_page.dart';
import 'package:flutter_app/ui/login/signup_page.dart';
import 'package:flutter_app/ui/main/main_home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:toast/toast.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Sizes _sizes = Sizes();
  Session _session = Session();
  ValidationLogin _validation = ValidationLogin();
  final _validator = GlobalKey<FormState>();
  final db = DatabaseLogin.instance;
  var _userNameController = TextEditingController();
  var _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).tr('login_page.top'),
          style: TextStyle(color: ca_blue),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: ca_blue),
      ),
      body: ListView(
        physics: ClampingScrollPhysics(),
        padding: EdgeInsets.only(
            left: _sizes.width16dp(context),
            right: _sizes.width16dp(context),
            top: _sizes.width16dp(context)),
        children: <Widget>[
          Text(
            AppLocalizations.of(context).tr('login_page.title'),
            style: TextStyle(
                fontSize: _sizes.width20dp(context),
                fontFamily: "CircularStd-Bold"),
          ),
          Text(
            AppLocalizations.of(context).tr('login_page.subtitle'),
            style: TextStyle(
                fontSize: _sizes.width16dp(context),
                fontFamily: "CircularStd-Book"),
          ),
          _form(),
          _other(),
          _facebook(),
          _google(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          alignment: Alignment.bottomCenter,
          height: 40,
          color: Colors.transparent,
          margin: EdgeInsets.only(bottom: _sizes.width16dp(context)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                AppLocalizations.of(context).tr("login_page.dont_have_account"),
                style: TextStyle(
                    fontSize: _sizes.width14dp(context),
                    fontFamily: "CircularStd-Book"),
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SignUp())),
                child: Text(
                  AppLocalizations.of(context).tr("login_page.sign_up"),
                  style: TextStyle(
                      fontSize: _sizes.width14dp(context),
                      fontWeight: FontWeight.bold,
                      fontFamily: "CircularStd-Book"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _form() {
    return Form(
      key: _validator,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: _sizes.width16dp(context)),
            child: TextFormField(
              validator: (value) => _validation.userName(context, value),
              controller: _userNameController,
              decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)
                      .tr('login_page.hint_user_name'),
                  hintStyle: TextStyle(fontSize: _sizes.width14dp(context))),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: _sizes.width16dp(context)),
            child: TextFormField(
              validator: (value) => _validation.password(context, value),
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)
                      .tr('login_page.hint_passowrd'),
                  hintStyle: TextStyle(fontSize: _sizes.width14dp(context))),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: _sizes.width16dp(context)),
            alignment: Alignment.topRight,
            child: GestureDetector(
              child: Text(
                AppLocalizations.of(context).tr('login_page.forgot_password'),
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: _sizes.width14dp(context),
                    fontFamily: 'CircularStd-Book'),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ForgotPassword()));
              },
            ),
          ),
//          Container(
//            margin: EdgeInsets.only(top: _sizes.width16dp(context)),
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: <Widget>[
//                Text(
//                  'Saved Log in',
//                  style: TextStyle(
//                      fontSize: _sizes.width14dp(context),
//                      fontFamily: "CircularStd-Book"),
//                ),
//                defaultTargetPlatform == TargetPlatform.android
//                    ? Switch(
//                        value: _switch,
//                        onChanged: (bool value) {
//                          setState(() {
//                            _switch = value;
//                          });
//                        },
//                        activeColor: ca_red,
//                      )
//                    : CupertinoSwitch(
//                        value: _switch,
//                        onChanged: (bool value) {
//                          setState(() {
//                            _switch = value;
//                          });
//                        },
//                        activeColor: ca_red,
//                      ),
//              ],
//            ),
//          ),
          GestureDetector(
            onTap: () => {
              if (_validator.currentState.validate()) {_getLogin()}
            },
            child: Button(
                title: AppLocalizations.of(context).tr('login_page.button')),
          )
        ],
      ),
    );
  }

  Widget _other() {
    return Container(
      margin: EdgeInsets.only(top: _sizes.width4dp(context)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width / 2.5,
            height: 1,
            color: ca_gray,
          ),
          Text(
            AppLocalizations.of(context).tr('login_page.or'),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 2.5,
            height: 1,
            color: ca_gray,
          )
        ],
      ),
    );
  }

  Widget _facebook() {
    return GestureDetector(onTap: () => {}, child: ButtonFacebook());
  }

  Widget _google() {
    return GestureDetector(onTap: () => {}, child: ButtonGoogle());
  }

  void _getLogin() async {
    Map<String, dynamic> row = {
      DatabaseLogin.columnUserName: _userNameController.text,
      DatabaseLogin.columnPassword: _passwordController.text,
    };
    final login = await db.getLogin(row);
    if (login != null) {
      await _session.setUserName(login[0][DatabaseLogin.columnUserName]);
      await _session.setFullName(login[0][DatabaseLogin.columnFullName]);
      Navigator.push(context, MaterialPageRoute(builder: (context) => Main()));
    } else {
      Toast.show(AppLocalizations.of(context).tr('login_page.login_fail'), context);
    }
  }
}
