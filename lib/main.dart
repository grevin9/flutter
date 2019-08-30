import 'package:flutter/material.dart';
import 'package:flutter_app/common/colors.dart';
import 'package:flutter_app/ui/login/login_page.dart';
import 'package:flutter_app/common/sizes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_app/common/widget/button.dart';

void main() => runApp(EasyLocalization(child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = EasyLocalizationProvider.of(context).data;
    return EasyLocalizationProvider(
      data: data,
      child: MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          EasylocaLizationDelegate(
              locale: data.locale, path: 'assets/languages'),
        ],
        supportedLocales: [Locale('en', 'US'), Locale('id', 'ID')],
        locale: data.savedLocale,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
//        home: Login(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Sizes _sizes = Sizes();
  double opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    var data = EasyLocalizationProvider.of(context).data;
    return EasyLocalizationProvider(
      data: data,
      child: Scaffold(
        body: Center(
          child: Container(
            padding: EdgeInsets.only(
                left: _sizes.width16dp(context),
                right: _sizes.width16dp(context)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  AppLocalizations.of(context).tr('main_page.title'),
                  style: TextStyle(
                      fontFamily: 'CircularStd-Medium',
                      fontSize: _sizes.width20dp(context)),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      opacity = 1.0;
                      data.changeLocale(Locale('en', 'US'));
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top: _sizes.width8dp(context)),
                    padding: EdgeInsets.only(
                        top: _sizes.width16dp(context),
                        bottom: _sizes.width16dp(context)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          AppLocalizations.of(context).tr('main_page.english'),
                          style: TextStyle(
                              fontFamily: "CircularStd-Medium",
                              fontSize: _sizes.width14dp(context)),
                        ),
                        Opacity(
                            opacity: opacity == 1.0 ? 1.0 : 0.0,
                            child: Icon(Icons.done, color: ca_blue)),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 1,
                  color: ca_gray,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      opacity = 2.0;
                      data.changeLocale(Locale('id', 'ID'));
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(
                        top: _sizes.width16dp(context),
                        bottom: _sizes.width16dp(context)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          AppLocalizations.of(context)
                              .tr('main_page.indonesia'),
                          style: TextStyle(fontFamily: "CircularStd-Medium", fontSize: _sizes.width14dp(context)),
                        ),
                        Opacity(
                            opacity: opacity == 2.0 ? 1.0 : 0.0,
                            child: Icon(Icons.done, color: ca_blue))
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 1,
                  color: ca_gray,
                ),
                Container(
                  margin: EdgeInsets.only(top: _sizes.width20dp(context)),
                  child: Button(
                    title: AppLocalizations.of(context).tr('main_page.button'),
                    to: Login(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
