import 'package:flutter/material.dart';
import 'package:flutter_app/common/colors.dart';
import 'package:flutter_app/common/sizes.dart';
import 'package:toast/toast.dart';

class Button extends StatefulWidget {
  final String title;
  final Widget to;
  const Button({Key key, this.title, this.to}) : super(key: key);
  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  Sizes _sizes = new Sizes();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Toast.show("Successful!", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
        Navigator.push(context, MaterialPageRoute(builder: (context) => widget.to));
      },
      child: Container(
        margin: EdgeInsets.only(top: _sizes.width16dp(context)),
        padding: EdgeInsets.only(top: _sizes.width12dp(context), bottom: _sizes.width12dp(context)),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: ca_red,
        ),
        child: Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
