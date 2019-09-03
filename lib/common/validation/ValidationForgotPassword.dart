import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/validation/Validation.dart';

class ValidationForgotPassword{
  email(BuildContext context, String value){
    Validation _validation = Validation();
    if (value.isEmpty) {
      return AppLocalizations.of(context).tr('forgot_password_validation.email_filled');
    } else if (!_validation.email(value)) {
      return AppLocalizations.of(context).tr('forgot_password_validation.email_valid');
    }
    return null;
  }
}