import 'package:flutter/material.dart';
import 'package:flutter_app/common/Colors.dart';
import 'package:flutter_app/common/Sizes.dart';

class ButtonForm extends StatefulWidget {
  final String title;

  const ButtonForm({Key key, this.title}) : super(key: key);

  @override
  _ButtonFormState createState() => _ButtonFormState();
}

class _ButtonFormState extends State<ButtonForm> {
  Sizes _sizes = Sizes();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
            top: _sizes.width16dp(context),
            bottom: MediaQuery.of(context).size.width / 10),
        padding: EdgeInsets.only(
            top: _sizes.width12dp(context), bottom: _sizes.width12dp(context)),
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              blurRadius: 8.0,
              color: Colors.black.withOpacity(.6),
              offset: Offset(1.0, 2.0))
        ], borderRadius: BorderRadius.circular(8.0), color: ca_red),
        child: Text(
          widget.title,
          style: TextStyle(
              color: Colors.white,
              fontFamily: "CircularBook",
              fontSize: _sizes.width14dp(context)),
        ));
  }
}
