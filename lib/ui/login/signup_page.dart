import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_app/common/colors.dart';
import 'package:flutter_app/common/sizes.dart';
import 'package:flutter_app/logic/validation_signup.dart';
import 'package:intl/intl.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Sizes _sizes = Sizes();
  ValidationSignUp _validation = ValidationSignUp();
  final _validator = GlobalKey<FormState>();
  var _date = "";
  var _dateController = TextEditingController();
  var _flagMale = false;
  var _flagFemale = false;
  var _flagTerm = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).tr('signup_page.top'),
          style: TextStyle(color: ca_blue),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: ca_blue),
      ),
      body: Form(
        key: _validator,
        child: _form(),
      ),
    );
  }

  Widget _form() {
    return ListView(
      padding: EdgeInsets.only(
          top: _sizes.width16dp(context),
          left: _sizes.width16dp(context),
          right: _sizes.width16dp(context)),
      physics: ClampingScrollPhysics(),
      children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: Text(AppLocalizations.of(context).tr('signup_page.user_name')),
        ),
        TextFormField(
          validator: (value) => _validation.userName(context, value),
          decoration: InputDecoration(
              hintText:
                  AppLocalizations.of(context).tr('signup_page.hint_user_name'),
              hintStyle: TextStyle(fontSize: _sizes.width14dp(context))),
        ),
        Container(
          margin: EdgeInsets.only(top: _sizes.width20dp(context)),
          alignment: Alignment.topLeft,
          child: Text(AppLocalizations.of(context).tr('signup_page.password')),
        ),
        TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            hintText:
                AppLocalizations.of(context).tr('signup_page.hint_password'),
            hintStyle: TextStyle(fontSize: _sizes.width14dp(context)),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: _sizes.width20dp(context)),
          alignment: Alignment.topLeft,
          child: Text(
              AppLocalizations.of(context).tr('signup_page.confirm_password')),
        ),
        TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            hintText: AppLocalizations.of(context)
                .tr('signup_page.hint_confirm_password'),
            hintStyle: TextStyle(fontSize: _sizes.width14dp(context)),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: _sizes.width20dp(context)),
          alignment: Alignment.topLeft,
          child: Text(AppLocalizations.of(context).tr('signup_page.full_name')),
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText:
                AppLocalizations.of(context).tr('signup_page.hint_full_name'),
            hintStyle: TextStyle(fontSize: _sizes.width14dp(context)),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: _sizes.width20dp(context)),
          alignment: Alignment.topLeft,
          child: Text(
            AppLocalizations.of(context).tr('signup_page.bod'),
          ),
        ),
        GestureDetector(
          onTap: () {
            _time();
          },
          child: AbsorbPointer(
            child: TextFormField(
              readOnly: true,
              autofocus: false,
              controller: _dateController,
              decoration: InputDecoration(
                  hintText:
                      AppLocalizations.of(context).tr('signup_page.hint_bod'),
                  hintStyle: TextStyle(fontSize: _sizes.width14dp(context))),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: _sizes.width20dp(context)),
          alignment: Alignment.topLeft,
          child: Text(
            AppLocalizations.of(context).tr('signup_page.email'),
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
              hintText:
                  AppLocalizations.of(context).tr('signup_page.hint_email'),
              hintStyle: TextStyle(fontSize: _sizes.width14dp(context))),
        ),
        Container(
          margin: EdgeInsets.only(top: _sizes.width20dp(context)),
          alignment: Alignment.topLeft,
          child: Text(
            AppLocalizations.of(context).tr('signup_page.phone'),
          ),
        ),
        TextFormField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              hintText:
                  AppLocalizations.of(context).tr('signup_page.hint_phone'),
              hintStyle: TextStyle(fontSize: _sizes.width14dp(context))),
        ),
        Container(
          margin: EdgeInsets.only(top: _sizes.width20dp(context)),
          alignment: Alignment.topLeft,
          child: Text(AppLocalizations.of(context).tr('signup_page.gender')),
        ),
        Row(
          children: <Widget>[
            Radio(
              value: _flagMale ? 1 : 0,
              groupValue: 1,
              onChanged: (value) {
                setState(() {
                  _flagMale = true;
                  _flagFemale = false;
                });
              },
            ),
            Text(AppLocalizations.of(context).tr('signup_page.male')),
            Radio(
              value: _flagFemale ? 1 : 0,
              groupValue: 1,
              onChanged: (value) {
                setState(() {
                  _flagMale = false;
                  _flagFemale = true;
                });
              },
            ),
            Text(AppLocalizations.of(context).tr('signup_page.female'))
          ],
        ),
        Row(
          children: <Widget>[
            Checkbox(
              value: _flagTerm,
              onChanged: (value) {
                setState(() {
                  if (_flagTerm)
                    _flagTerm = false;
                  else
                    _flagTerm = true;
                });
              },
            ),
            Text(
              AppLocalizations.of(context).tr('signup_page.agree'),
              style: TextStyle(fontSize: _sizes.width14dp(context)),
            ),
            Text(
              AppLocalizations.of(context).tr('signup_page.term'),
              style: TextStyle(
                  fontSize: _sizes.width14dp(context), color: Colors.lightBlue),
            )
          ],
        ),
        RaisedButton(
          onPressed: () {
            if (_validator.currentState.validate()) {
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text('Processing Data')));
            }
          },
        )
      ],
    );
  }

  _time() async {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      showCupertinoModalPopup<void>(
          context: context,
          builder: (BuildContext context) {
            return Container(
              color: Colors.white,
              height: _sizes.width(context) / 1.8,
              child: Stack(children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: _sizes.width16dp(context)),
                  height: _sizes.width(context) / 2,
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    initialDateTime: DateTime.now(),
                    minimumYear: 1900,
                    maximumYear: 2020,
                    onDateTimeChanged: (DateTime newDateTime) {
                      setState(() {
                        _date = DateFormat('dd-MM-yyyy').format(newDateTime);
                      });
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  margin: EdgeInsets.only(top: _sizes.width10dp(context)),
                  height: _sizes.width(context) / 15,
                  child: FlatButton(
                    onPressed: () {
                      _dateController.text = _date;
                      Navigator.pop(context);
                    },
                    child: Text(
                      AppLocalizations.of(context)
                          .tr('signup_page.button_date'),
                      style: TextStyle(
                          fontSize: _sizes.width14dp(context),
                          color: Colors.lightBlue),
                    ),
                  ),
                )
              ]),
            );
          });
    } else {
      var _time = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime(2020));
      setState(() {
        if (_time != null) {
          _dateController.text = DateFormat('dd-MM-yyyy').format(_time);
        }
      });
    }
  }
}
