import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/common/widget/Button.dart';
import 'package:flutter_app/common/Colors.dart';
import 'package:flutter_app/common/FontFamily.dart';
import 'package:flutter_app/common/Sizes.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as LocationManager;

class MainMap extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MainMap> {
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> markers = Set();
  Sizes _sizes = Sizes();
  var _fromController = TextEditingController();
  var _toController = TextEditingController();
  var latlng;

  static final CameraPosition _location = CameraPosition(
    target: LatLng(-6.1702962, 106.7887946),
    zoom: 14.4746,
  );

  Future<LatLng> getUserLocation() async {
    var _currentLocation = <String, double>{};
    final _location = LocationManager.Location();
    try {
      _currentLocation = await _location.getLocation();
      final _lat = _currentLocation['latitude'];
      final _lng = _currentLocation['longitude'];
      final _center = LatLng(_lat, _lng);
      return _center;
    } on Exception {
      _currentLocation = null;
      return null;
    }
  }

  void _onMapCreated(GoogleMapController controller) async {
    final _center = await getUserLocation();
    _controller.complete(controller);
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: _center, zoom: 18.0)));
  }

  void _addMaker() {
    Marker marker = Marker(
      markerId: MarkerId(markers.length.toString()),
      position: LatLng(-6.1781293, 106.7894204),
    );
    markers.add(marker);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        myLocationEnabled: true,
        initialCameraPosition: _location,
        onMapCreated: _onMapCreated,
        markers: markers,
      ),
      bottomSheet: _bottomsheet()

//      floatingActionButton: FloatingActionButton(
//        onPressed: () {
//          setState(() {
//            _addMaker();
//          });
//        },
//      ),
    );
  }

   Widget _bottomsheet(){
      return Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurRadius: 8.0,
                  color: Colors.black.withOpacity(.6),
                  offset: Offset(1.0, 2.0))
            ],
            borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
            color: Colors.white),
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(
            left: _sizes.width16dp(context),
            right: _sizes.width16dp(context)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(Icons.drag_handle),
            Container(
              height: 1,
              width: MediaQuery.of(context).size.width,
              color: Colors.black38,
            ),
            Container(
                margin: EdgeInsets.only(top: _sizes.width16dp(context)),
                alignment: Alignment.topLeft,
                child: Text('From',
                    style: TextStyle(
                        fontFamily: circular_medium,
                        fontSize: _sizes.width14dp(context)))),
            TextField(
              controller: _fromController,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      setState(() {
                        _fromController.text = "";
                      });
                    },
                  ),
                  hintText: 'Current Location',
                  hintStyle: TextStyle(fontSize: _sizes.width14dp(context))),
            ),
            Container(
                margin: EdgeInsets.only(top: _sizes.width20dp(context)),
                alignment: Alignment.topLeft,
                child: Text('To',
                    style: TextStyle(
                        fontFamily: circular_medium,
                        fontSize: _sizes.width14dp(context)))),
            TextField(
              controller: _toController,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      setState(() {
                        _toController.text = "";
                      });
                    },
                  ),
                  hintText: 'Current Location',
                  hintStyle: TextStyle(fontSize: _sizes.width14dp(context))),
            ),
            Button(title: 'ROUTE')
          ],
        ),
      );
  }
}
