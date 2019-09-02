import 'package:flutter/material.dart';
import 'package:flutter_app/common/widget/button.dart';
import 'package:flutter_app/common/colors.dart';
import 'package:flutter_app/common/sizes.dart';
import 'package:flutter_app/common/widget/button_facebook.dart';
import 'package:flutter_app/common/widget/button_google.dart';
import 'package:flutter_app/ui/login/forgot_password_page.dart';
import 'package:flutter_app/ui/login/signup_page.dart';
import 'package:flutter_app/ui/main/main_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:easy_localization/easy_localization.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Sizes _sizes = Sizes();
  final _formKey = GlobalKey<FormState>();
  var _textController = new TextEditingController();
  bool _switch = false;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).tr('login_page.login'),
          style: TextStyle(color: ca_blue),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: ca_blue),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                left: _sizes.width16dp(context),
                right: _sizes.width16dp(context),
                top: _sizes.width16dp(context)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    child: Text(
                      AppLocalizations.of(context)
                          .tr('login_page.forgot_password'),
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: _sizes.width14dp(context),
                          fontFamily: 'CircularStd-Book'),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgotPassword()));
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: _sizes.width16dp(context)),
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
                ),
                _facebook(),
                _google(),
              ],
            ),
          ),
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
      key: _formKey,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: _sizes.width16dp(context)),
            child: TextFormField(
              controller: _textController,
              validator: (value) {
                if (value.isEmpty) {
                  return 'please wait';
                } else if (value.length < 5) {
                  return 'length';
                }
                return null;
              },
              decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)
                      .tr('login_page.hint_user_name'),
                  hintStyle: TextStyle(fontSize: _sizes.width14dp(context))),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: _sizes.width16dp(context)),
            child: TextField(
              decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)
                      .tr('login_page.hint_passowrd'),
                  hintStyle: TextStyle(fontSize: _sizes.width14dp(context))),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: _sizes.width16dp(context)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Saved Log in',
                  style: TextStyle(
                      fontSize: _sizes.width14dp(context),
                      fontFamily: "CircularStd-Book"),
                ),
                defaultTargetPlatform == TargetPlatform.android
                    ? Switch(
                        value: _switch,
                        onChanged: (bool value) {
                          setState(() {
                            _switch = value;
                          });
                        },
                        activeColor: ca_red,
                      )
                    : CupertinoSwitch(
                        value: _switch,
                        onChanged: (bool value) {
                          setState(() {
                            _switch = value;
                          });
                        },
                        activeColor: ca_red,
                      ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: _sizes.width16dp(context)),
            child: RaisedButton(
              color: Colors.red,
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              },
              child: Text(
                'Submit',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 34,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Main(
                            title: _textController.text,
                            desc: "kamu",
                          )))
            },
            child: Button(
                title: AppLocalizations.of(context).tr('login_page.button')),
          )
        ],
      ),
    );
  }

  Widget _facebook() {
    return GestureDetector(
      onTap: () => {

      },
      child: ButtonFacebook()
    );
  }

  Widget _google() {
    return GestureDetector(
      onTap: () => {

      },
      child: ButtonGoogle()
    );
  }
}
