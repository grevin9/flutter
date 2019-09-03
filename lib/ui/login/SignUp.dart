import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_app/common/Colors.dart';
import 'package:flutter_app/common/FontFamily.dart';
import 'package:flutter_app/common/Sizes.dart';
import 'package:flutter_app/common/widget/ButtonForm.dart';
import 'package:flutter_app/common/validation/ValidationSignUp.dart';
import 'package:flutter_app/common/database/DatabaseLogin.dart';
import 'package:intl/intl.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Sizes _sizes = Sizes();
  ValidationSignUp _validation = ValidationSignUp();
  final _validator = GlobalKey<FormState>();
  final db = DatabaseLogin.instance;
  var _userNameController = TextEditingController();
  var _passwordController = TextEditingController();
  var _fullNameController = TextEditingController();
  var _emailController = TextEditingController();
  var _phoneController = TextEditingController();
  var _dateController = TextEditingController();
  var _date = "";
  var _flagMale = false;
  var _flagFemale = false;
  var _flagTerm = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).tr('signup_page.top'),
          style: TextStyle(fontFamily: circular_book, color: ca_blue),
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
          child: Text(AppLocalizations.of(context).tr('signup_page.user_name'), style: TextStyle(fontFamily: circular_medium)),
        ),
        TextFormField(
          validator: (value) => _validation.userName(context, value),
          controller: _userNameController,
          decoration: InputDecoration(
              hintText:
                  AppLocalizations.of(context).tr('signup_page.hint_user_name'),
              hintStyle: TextStyle(fontSize: _sizes.width14dp(context))),
        ),
        Container(
          margin: EdgeInsets.only(top: _sizes.width20dp(context)),
          alignment: Alignment.topLeft,
          child: Text(AppLocalizations.of(context).tr('signup_page.password'), style: TextStyle(fontFamily: circular_medium)),
        ),
        TextFormField(
          validator: (value) => _validation.password(context, value),
          obscureText: true,
          controller: _passwordController,
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
              AppLocalizations.of(context).tr('signup_page.confirm_password'), style: TextStyle(fontFamily: circular_medium)),
        ),
        TextFormField(
          validator: (value) => _validation.confirmPassword(
              context, value, _passwordController.text),
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
          child: Text(AppLocalizations.of(context).tr('signup_page.full_name'), style: TextStyle(fontFamily: circular_medium)),
        ),
        TextFormField(
          validator: (value) => _validation.fullName(context, value),
          controller: _fullNameController,
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
            AppLocalizations.of(context).tr('signup_page.bod'), style: TextStyle(fontFamily: circular_medium),
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
              validator: (value) => _validation.bod(context, value),
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
            AppLocalizations.of(context).tr('signup_page.email'), style: TextStyle(fontFamily: circular_medium)
          ),
        ),
        TextFormField(
          validator: (value) => _validation.email(context, value),
          controller: _emailController,
          decoration: InputDecoration(
              hintText:
                  AppLocalizations.of(context).tr('signup_page.hint_email'),
              hintStyle: TextStyle(fontSize: _sizes.width14dp(context))),
        ),
        Container(
          margin: EdgeInsets.only(top: _sizes.width20dp(context)),
          alignment: Alignment.topLeft,
          child: Text(
            AppLocalizations.of(context).tr('signup_page.phone'), style: TextStyle(fontFamily: circular_medium)
          ),
        ),
        TextFormField(
          validator: (value) => _validation.phone(context, value),
          controller: _phoneController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              hintText:
                  AppLocalizations.of(context).tr('signup_page.hint_phone'),
              hintStyle: TextStyle(fontSize: _sizes.width14dp(context))),
        ),
        Container(
          margin: EdgeInsets.only(top: _sizes.width20dp(context)),
          alignment: Alignment.topLeft,
          child: Text(AppLocalizations.of(context).tr('signup_page.gender'), style: TextStyle(fontFamily: circular_medium)),
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
            Text(AppLocalizations.of(context).tr('signup_page.male'), style: TextStyle(fontFamily: circular_medium)),
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
            Text(AppLocalizations.of(context).tr('signup_page.female'), style: TextStyle(fontFamily: circular_medium))
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
              style: TextStyle(fontFamily: circular_medium, fontSize: _sizes.width14dp(context)),
            ),
            Text(
              AppLocalizations.of(context).tr('signup_page.term'),
              style: TextStyle(
                  fontFamily: circular_medium, fontSize: _sizes.width14dp(context), color: Colors.lightBlue),
            )
          ],
        ),
        Builder(builder: (context) => Center(child: _submit()))
      ],
    );
  }

  Widget _submit() {
    return GestureDetector(
      onTap: () => {
        if (_validator.currentState.validate() &&
            _flagTerm &&
            (_flagMale || _flagFemale))
          {_insert()}
      },
      child: ButtonForm(
        title: AppLocalizations.of(context).tr('signup_page.button'),
      ),
    );
  }

  void _insert() async {
    var _gender = 0;
    if (_flagMale) _gender = 1;
    if (_flagFemale) _gender = 2;
    Map<String, dynamic> row = {
      DatabaseLogin.columnUserName: _userNameController.text,
      DatabaseLogin.columnPassword: _passwordController.text,
      DatabaseLogin.columnFullName: _fullNameController.text,
      DatabaseLogin.columnBOD: _dateController.text,
      DatabaseLogin.columnEmail: _emailController.text,
      DatabaseLogin.columnPhone: _phoneController.text,
      DatabaseLogin.columnGender: _gender,
    };
    await db.insert(row);
    Navigator.pop(context);
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
