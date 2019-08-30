import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

class ValidationSignUp{
  userName(BuildContext context, String value){
    if (value.isEmpty) {
      return AppLocalizations.of(context).tr('signup_validation.username_filled');
    } else if (value.length < 3 && value.length > 15) {
      return AppLocalizations.of(context).tr('signup_validation.username_length');
    }
    return null;
  }
}