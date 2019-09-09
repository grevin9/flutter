import 'package:flutter/material.dart';
import 'package:flutter_app/common/Colors.dart';
import 'package:flutter_app/common/FontFamily.dart';
import 'package:flutter_app/common/Sizes.dart';

class StationScreen extends StatefulWidget {
  @override
  _StationScreenState createState() => _StationScreenState();
}

class _StationScreenState extends State<StationScreen> {
  var stations = ['Angke', 'Bogor', 'Ciledug', 'Duri', 'Empang', 'Fuji', 'Gang Sentiong', 'Himalaya', 'Inem', 'Jepang'];
  Sizes _sizes = Sizes();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Station', style: TextStyle(color: ca_blue)),
        iconTheme: IconThemeData(color: ca_blue),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(itemCount: 10,itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.only(top: index==0?_sizes.width16dp(context):_sizes.width8dp(context), bottom: _sizes.width8dp(context), left: _sizes.width16dp(context), right: _sizes.width16dp(context)),
          alignment: Alignment.topLeft,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context, stations[index]);
            },
            child: Column(
              children: <Widget>[
                Text(stations[index], style: TextStyle(fontFamily: circular_medium),)
              ],
            ),
          ),
        );
      }),
    );
  }
}
