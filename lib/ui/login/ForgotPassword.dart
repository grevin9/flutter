import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/Colors.dart';
import 'package:flutter_app/common/FontFamily.dart';
import 'package:flutter_app/common/Sizes.dart';
import 'package:flutter_app/common/widget/ButtonForm.dart';
import 'package:flutter_app/common/validation/ValidationForgotPassword.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  Sizes _sizes = Sizes();
  final _validator = GlobalKey<FormState>();
  ValidationForgotPassword _validation = ValidationForgotPassword();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).tr('forgot_password_page.top'),
            style: TextStyle(fontFamily: circular_book, color: ca_blue)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: ca_blue),
      ),
      body: Form(
        key: _validator,
        child: Container(
          padding: EdgeInsets.only(
              top: _sizes.width16dp(context),
              left: _sizes.width16dp(context),
              right: _sizes.width16dp(context)),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Text(AppLocalizations.of(context)
                    .tr('forgot_password_page.email'), style: TextStyle(fontFamily: circular_medium)),
              ),
              TextFormField(
                validator: (value) => _validation.email(context, value),
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)
                      .tr('forgot_password_page.hint_email'),
                  hintStyle: TextStyle(fontSize: _sizes.width14dp(context)),
                ),
              ),
              Builder(builder: (context) => Center(child: _submit()))
            ],
          ),
        ),
      ),
    );
  }

  Widget _submit() {
    return GestureDetector(
      onTap: () => {
        if (_validator.currentState.validate()) {Navigator.pop(context)}
      },
      child: ButtonForm(
        title: AppLocalizations.of(context).tr('forgot_password_page.button'),
      ),
    );
  }
}
