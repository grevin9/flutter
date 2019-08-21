import 'package:flutter/material.dart';
import 'package:flutter_app/common/colors.dart';

class Main extends StatefulWidget {
  final String title;
  final String desc;
  const Main({Key key, this.title, this.desc}) : super(key: key);
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: ca_blue),
        ),
        iconTheme: IconThemeData(color: ca_blue),
        backgroundColor: Colors.white,
      ),
    );
  }
}
