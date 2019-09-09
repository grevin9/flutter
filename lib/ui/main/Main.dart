import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/Colors.dart';
import 'package:flutter_app/common/FontFamily.dart';
import 'package:flutter_app/ui/main/MainHome.dart';
import 'package:flutter_app/ui/main/MainMap.dart';
import 'package:flutter_app/ui/main/MainPhoto.dart';
import 'package:flutter_app/ui/main/MainSetting.dart';

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  var _index = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text(
//          'WELCOME',
//          style: TextStyle(color: ca_blue),
//        ),
//        iconTheme: IconThemeData(color: ca_blue),
//        backgroundColor: Colors.white,
//      ),
      body: Container(
        child: _index==0?MainHome():_index==1?MainPhoto():_index==2?MainMap():MainSetting(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: ca_red),
            title: Text(AppLocalizations.of(context).tr('main_home_page.home'), style: TextStyle(fontFamily: circular_bold, color: ca_red))
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_a_photo, color: ca_red),
              title: Text(AppLocalizations.of(context).tr('main_home_page.photo'), style: TextStyle(fontFamily: circular_bold, color: ca_red))
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.map, color: ca_red),
              title: Text(AppLocalizations.of(context).tr('main_home_page.map'), style: TextStyle(fontFamily: circular_bold, color: ca_red))
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings, color: ca_red),
              title: Text(AppLocalizations.of(context).tr('main_home_page.setting'), style: TextStyle(fontFamily: circular_bold, color: ca_red))
          )
        ],
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
      ),
    );
  }
}
