import 'package:flutter/material.dart';
import 'package:flutter_app/common/colors.dart';
import 'package:flutter_app/common/images.dart';
import 'package:flutter_app/common/sizes.dart';

class ButtonFacebook extends StatelessWidget {
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
        ], borderRadius: BorderRadius.circular(8.0), color: ca_facebook),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: _sizes.width6dp(context)),
            child: Image(
              height: _sizes.width14dp(context),
              width: _sizes.width14dp(context),
              image: AssetImage(icon_fb),
            ),
          ),
          Text(
            'Facebook',
            style: TextStyle(
                color: Colors.white,
                fontFamily: "CircularStd-Book",
                fontSize: _sizes.width14dp(context)),
          )
        ]));
  }
}
