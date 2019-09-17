import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/Colors.dart';
import 'package:flutter_app/common/FontFamily.dart';
import 'package:flutter_app/common/Sizes.dart';
import 'package:flutter_app/common/widget/Button.dart';
import 'package:flutter_app/ui/login/Login.dart';
import 'package:flutter_app/ui/setting/Language.dart';

class MainSetting extends StatefulWidget {
  @override
  _MainSettingState createState() => _MainSettingState();
}

class _MainSettingState extends State<MainSetting> {
  Sizes _sizes = Sizes();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).tr('setting.top'),
            style: TextStyle(fontFamily: circular_book, color: ca_blue)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: ca_blue),
      ),
      body: Container(
        margin: EdgeInsets.only(
            left: _sizes.width16dp(context), right: _sizes.width16dp(context)),
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: (){},
              child: Container(
                  margin: EdgeInsets.only(top: _sizes.width8dp(context)),
                  padding: EdgeInsets.only(
                      top: _sizes.width12dp(context),
                      bottom: _sizes.width12dp(context)),
                  alignment: Alignment.topLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                          AppLocalizations.of(context).tr('setting.edit_profile'),
                          style: TextStyle(fontFamily: circular_medium)),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: ca_red,
                      )
                    ],
                  )),
            ),
            Container(
                width: _sizes.width(context), height: 1, color: Colors.black38),
            GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LanguageScreen())),
              child: Container(
                  padding: EdgeInsets.only(
                      top: _sizes.width12dp(context),
                      bottom: _sizes.width12dp(context)),
                  alignment: Alignment.topLeft,
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(AppLocalizations.of(context).tr('setting.language'),
                          style: TextStyle(fontFamily: circular_medium)),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: ca_red,
                      )
                    ],
                  )),
            ),
            Container(
                width: _sizes.width(context), height: 1, color: Colors.black38),
            GestureDetector(
              onTap: () {},
              child: Container(
                  padding: EdgeInsets.only(
                      top: _sizes.width12dp(context),
                      bottom: _sizes.width12dp(context)),
                  alignment: Alignment.topLeft,
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(AppLocalizations.of(context).tr('setting.about_us'),
                          style: TextStyle(fontFamily: circular_medium)),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: ca_red,
                      )
                    ],
                  )),
            ),
            Container(
                width: _sizes.width(context), height: 1, color: Colors.black38),
            GestureDetector(
                onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login())),
                child: Button(
                    title: AppLocalizations.of(context).tr('setting.logout')))
          ],
        ),
      ),
    );
  }
}
