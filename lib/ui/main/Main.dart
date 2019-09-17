import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/Colors.dart';
import 'package:flutter_app/common/FontFamily.dart';
import 'package:flutter_app/ui/main/MainHome.dart';
import 'package:flutter_app/ui/main/MainMap.dart';
import 'package:flutter_app/ui/main/MainPhoto.dart';
import 'package:flutter_app/ui/main/MainSetting.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  var _index = 2;
  var _progress = 0;
  bool _isLoading;
  bool _permissionReady;
  DownloadTaskStatus _status = DownloadTaskStatus.undefined;
  String _localPath;
  var _link =
      'http://barbra-coco.dyndns.org/student/learning_android_studio.pdf';

  @override
  void dispose() {
    FlutterDownloader.registerCallback(null);
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    FlutterDownloader.registerCallback((id, status, progress) {
      setState(() {
        _status = status;
        _progress = progress;
      });
    });

    _permissionReady = false;

    _prepare();
  }

  void _requestDownload() async {
    await FlutterDownloader.enqueue(
        url: _link,
        headers: {"auth": "test_for_sql_encoding"},
        savedDir: _localPath,
        showNotification: true,
        openFileFromNotification: true);
  }

  Future<Null> _prepare() async {
    _permissionReady = await _checkPermission();
    _localPath = (await _findLocalPath()) + '/Download';

    final _saveDir = Directory(_localPath);
    bool hasExisted = await _saveDir.exists();
    if (!hasExisted) {
      _saveDir.create();
    }

    _checkPermission().then((hasGranted) {
      setState(() {
        _permissionReady = hasGranted;
        if (_permissionReady) {
          _requestDownload();
        }
      });
    });
  }

  Future<bool> _checkPermission() async {
    if (defaultTargetPlatform == TargetPlatform.android) {
      PermissionStatus permission = await PermissionHandler()
          .checkPermissionStatus(PermissionGroup.storage);
      if (permission != PermissionStatus.granted) {
        Map<PermissionGroup, PermissionStatus> permissions =
            await PermissionHandler()
                .requestPermissions([PermissionGroup.storage]);
        if (permissions[PermissionGroup.storage] == PermissionStatus.granted) {
          return true;
        }
      } else {
        return true;
      }
    } else {
      return true;
    }
    return false;
  }

  Future<String> _findLocalPath() async {
    final _directory = defaultTargetPlatform == TargetPlatform.android
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();
    return _directory.path;
  }

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
        child: _index == 0
            ? MainHome()
            : _index == 1
                ? MainPhoto()
                : _index == 2 ? MainMap() : MainSetting(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: ca_red),
              title: Text(
                  AppLocalizations.of(context).tr('main_home_page.home'),
                  style: TextStyle(fontFamily: circular_bold, color: ca_red))),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_a_photo, color: ca_red),
              title: Text(
                  AppLocalizations.of(context).tr('main_home_page.photo'),
                  style: TextStyle(fontFamily: circular_bold, color: ca_red))),
          BottomNavigationBarItem(
              icon: Icon(Icons.map, color: ca_red),
              title: Text(AppLocalizations.of(context).tr('main_home_page.map'),
                  style: TextStyle(fontFamily: circular_bold, color: ca_red))),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings, color: ca_red),
              title: Text(
                  AppLocalizations.of(context).tr('main_home_page.setting'),
                  style: TextStyle(fontFamily: circular_bold, color: ca_red)))
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
