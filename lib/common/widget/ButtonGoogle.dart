import 'package:flutter/material.dart';
import 'package:flutter_app/common/Colors.dart';
import 'package:flutter_app/common/Images.dart';
import 'package:flutter_app/common/Sizes.dart';

class ButtonGoogle extends StatelessWidget {
  Sizes _sizes = Sizes();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: _sizes.width16dp(context)),
        padding: EdgeInsets.only(
            top: _sizes.width12dp(context), bottom: _sizes.width12dp(context)),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              blurRadius: 8.0,
              color: Colors.black.withOpacity(.6),
              offset: Offset(1.0, 2.0))
        ], borderRadius: BorderRadius.circular(8.0), color: Colors.white),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: _sizes.width6dp(context)),
            child: Image(
              height: _sizes.width14dp(context),
              width: _sizes.width14dp(context),
              image: AssetImage(icon_google),
            ),
          ),
          Text(
            'G',
            style: TextStyle(
                color: ca_google_blue,
                fontFamily: "CircularBook",
                fontSize: _sizes.width14dp(context)),
          ),
          Text(
            'o',
            style: TextStyle(
                color: ca_google_red,
                fontFamily: "CircularBook",
                fontSize: _sizes.width14dp(context)),
          ),
          Text(
            'o',
            style: TextStyle(
                color: ca_google_yellow,
                fontFamily: "CircularBook",
                fontSize: _sizes.width14dp(context)),
          ),
          Text(
            'g',
            style: TextStyle(
                color: ca_google_blue,
                fontFamily: "CircularBook",
                fontSize: _sizes.width14dp(context)),
          ),
          Text(
            'l',
            style: TextStyle(
                color: ca_google_green,
                fontFamily: "CircularBook",
                fontSize: _sizes.width14dp(context)),
          ),
          Text(
            'e',
            style: TextStyle(
                color: ca_google_red,
                fontFamily: "CircularBook",
                fontSize: _sizes.width14dp(context)),
          )
        ]));
  }
}
