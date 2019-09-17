import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/Colors.dart';
import 'package:flutter_app/common/FontFamily.dart';
import 'package:flutter_app/common/Sizes.dart';

class LanguageScreen extends StatefulWidget {
  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  Sizes _sizes = Sizes();

  @override
  Widget build(BuildContext context) {
    var data = EasyLocalizationProvider.of(context).data;
    return EasyLocalizationProvider(
      data: data,
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).tr('language.top'),
              style: TextStyle(color: ca_blue)),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: ca_blue),
        ),
        body: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                setState(() {
                  data.changeLocale(Locale('en', 'US'));
                });
              },
              child: Container(
                  margin: EdgeInsets.only(
                      top: _sizes.width8dp(context),
                      left: _sizes.width16dp(context),
                      right: _sizes.width16dp(context)),
                  padding: EdgeInsets.only(
                      top: _sizes.width12dp(context),
                      bottom: _sizes.width12dp(context)),
                  color: Colors.transparent,
                  alignment: Alignment.topLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(AppLocalizations.of(context).tr('language.english'),
                          style: TextStyle(
                              fontFamily: circular_medium,
                              fontSize: _sizes.width14dp(context))),
                      Opacity(
                          opacity: data.locale.languageCode == 'en' ? 1.0 : 0.0,
                          child: Icon(Icons.done, color: ca_red))
                    ],
                  )),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: _sizes.width16dp(context),
                  right: _sizes.width16dp(context)),
              width: _sizes.width(context),
              height: 1,
              color: Colors.black38,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  data.changeLocale(Locale('id', 'ID'));
                });
              },
              child: Container(
                  margin: EdgeInsets.only(
                      left: _sizes.width16dp(context),
                      right: _sizes.width16dp(context)),
                  padding: EdgeInsets.only(
                      top: _sizes.width12dp(context),
                      bottom: _sizes.width12dp(context)),
                  color: Colors.transparent,
                  alignment: Alignment.topLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                          AppLocalizations.of(context).tr('language.indonesia'),
                          style: TextStyle(
                              fontFamily: circular_medium,
                              fontSize: _sizes.width14dp(context))),
                      Opacity(
                          opacity: data.locale.languageCode == 'id' ? 1.0 : 0.0,
                          child: Icon(Icons.done, color: ca_red))
                    ],
                  )),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: _sizes.width16dp(context),
                  right: _sizes.width16dp(context)),
              width: _sizes.width(context),
              height: 1,
              color: Colors.black38,
            )
          ],
        ),
      ),
    );
  }
}
