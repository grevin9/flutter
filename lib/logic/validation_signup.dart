import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/logic/validation.dart';

class ValidationSignUp{
  userName(BuildContext context, String value){
    if (value.isEmpty) {
      return AppLocalizations.of(context).tr('signup_validation.username_filled');
    } else if (value.length < 3 && value.length > 15) {
      return AppLocalizations.of(context).tr('signup_validation.username_valid');
    }
    return null;
  }
  password(BuildContext context, String value){
    RegExp _no_upperCase    = new RegExp(r'^(?=.*[a-z])(?=.*[0-9])(?=\\S+$).{8,15}');
    RegExp _with_upperCase  = new RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=\S+$).{8,15}');
    if (value.isEmpty) {
      return AppLocalizations.of(context).tr('signup_validation.password_filled');
    } else if (_no_upperCase.hasMatch(value)) {
      return null;
    } else if (_with_upperCase.hasMatch(value)) {
      return null;
    }
    return AppLocalizations.of(context).tr('signup_validation.password_valid');
  }
  confirmPassword(BuildContext context, String value, String password){
    if (value.isEmpty) {
      return AppLocalizations.of(context).tr('signup_validation.confirm_filled');
    } else if (value != password) {
      return AppLocalizations.of(context).tr('signup_validation.confirm_valid');
    }
    return null;
  }
  fullName(BuildContext context, String value) {
    if (value.isEmpty) {
      return AppLocalizations.of(context).tr('signup_validation.fullname_filled');
    }
    return null;
  }
  bod(BuildContext context, String value) {
    if (value.isEmpty) {
      return AppLocalizations.of(context).tr('signup_validation.bod_filled');
    }
    return null;
  }
  email(BuildContext context, String value) {
    Validation _validation = Validation();
    if (value.isEmpty) {
      return AppLocalizations.of(context).tr('signup_validation.email_filled');
    } else if (!_validation.email(value)) {
      return AppLocalizations.of(context).tr('signup_validation.email_valid');
    }
    return null;
  }
  phone(BuildContext context, String value) {
    if (value.isEmpty) {
      return AppLocalizations.of(context).tr('signup_validation.phone_filled');
    } else if (value.length < 5 && value.length > 15) {
      return AppLocalizations.of(context).tr('signup_validation.phone_valid');
    }
    return null;
  }
}