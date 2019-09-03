import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ValidationLogin{
  userName(BuildContext context, String value) {
    if (value.isEmpty) {
      return AppLocalizations.of(context).tr('login_validation.username_filled');
    }
    return null;
  }
  password(BuildContext context, String value) {
    if (value.isEmpty) {
      return AppLocalizations.of(context).tr('login_validation.password_filled');
    }
    return null;
  }
}