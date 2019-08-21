import 'package:flutter/material.dart';
import 'package:flutter_app/common/widget/button.dart';
import 'package:flutter_app/common/colors.dart';
import 'package:flutter_app/common/sizes.dart';
import 'package:flutter_app/ui/main/main_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Sizes _sizes = Sizes();
  final _formKey = GlobalKey<FormState>();
  bool _switch = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'LOGIN',
          style: TextStyle(color: ca_blue),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        physics: ClampingScrollPhysics(),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                left: _sizes.width16dp(context),
                right: _sizes.width16dp(context),
                top: 600),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Welcome',
                  style: TextStyle(
                      fontSize: _sizes.width20dp(context),
                      fontFamily: "CircularStd-Bold"),
                ),
                Text(
                  'Sign in to continue',
                  style: TextStyle(
                      fontSize: _sizes.width16dp(context),
                      fontFamily: "CircularStd-Book"),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: _sizes.width16dp(context)),
                        child: TextFormField(validator: (value) {
                          if(value.isEmpty) {
                            return 'please wait';
                          } else if(value.length < 5) {
                            return 'length';
                          }
                          return null;
                        },
                          decoration:
                          InputDecoration(hintText: 'User name or phone number'),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: _sizes.width16dp(context)),
                        child: TextField(
                          decoration: InputDecoration(hintText: 'Password'),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: _sizes.width16dp(context)),
                        child: GestureDetector(
                          child: Text(
                            'Forgot password?',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: _sizes.width14dp(context),
                                fontFamily: 'CircularStd-Book'),
                          ),
                          onTap: () {},
                        ),
                      ),
                      defaultTargetPlatform == TargetPlatform.android ? Switch(
                        value: _switch,
                        onChanged: (bool value){
                          setState(() {
                            _switch = value;
                          });
                        },
                        activeColor: ca_red,
                      ) : CupertinoSwitch(
                        value: _switch,
                        onChanged: (bool value){
                          setState(() {
                            _switch = value;
                          });
                        },
                        activeColor: ca_red,
                      ),
                      RaisedButton(
                        color: Colors.red,
                        onPressed: () {
                          if(_formKey.currentState.validate()) {
                            Scaffold.of(context).showSnackBar(SnackBar(content: Text('Processing Data')));
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
                      Button(title: "SIGN IN", to: Main(title: "Saya", desc: "Kamu")),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
