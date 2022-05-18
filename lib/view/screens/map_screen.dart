import 'dart:async';

import 'package:et_tracking/model/car.dart';
import 'package:et_tracking/model/carslistfile.dart';
import 'package:et_tracking/view/wed/btmsheetcontwed.dart';
import 'package:et_tracking/view/wed/searchwed.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'et-tracking',
      home: MapSample(),
    );
  }
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

const colorr = const Color(0xff046547);

class MapSampleState extends State<MapSample> {
  static Completer<GoogleMapController> _controller = Completer();
  List<Marker> markerlist = [];
  BitmapDescriptor redmarker;
  BitmapDescriptor bluemarker;
  BitmapDescriptor greenmarker;
  BitmapDescriptor greymarker;
  BitmapDescriptor yellowmarker;

  Future<void> _setmarkericon() async {
    redmarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'images/red-car.png');
    bluemarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'images/blue-car.png');
    greenmarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'images/green-car.png');
    yellowmarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'images/yellow-car.png');
    greymarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'images/grey-car.png');
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(24.466667, 54.366669),
    zoom: 12,
  );

  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  VoidCallback _showPersBottomSheetCallBack;
  @override
  void initState() {
    super.initState();
    _setmarkericon();
    _updatemarkers();
    _showPersBottomSheetCallBack = _showBottomSheet;
  }

  void _showBottomSheet() {
    setState(() {
      _showPersBottomSheetCallBack = null;
    });
    _scaffoldKey.currentState
        .showBottomSheet(
          (context) {
            return BtmCont();
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: const Radius.circular(50),
                topLeft: Radius.circular(50)),
          ),
        )
        .closed
        .whenComplete(() {
          if (mounted) {
            setState(() {
              _showPersBottomSheetCallBack = _showBottomSheet;
            });
          }
        });
  }

  _updatemarkers() {
    Timer.periodic(Duration(seconds: 10), (t) {
      setState(() {
        carsList[1] = new Car('234', 'Engin On - Moving', 'driver', '160km',
            new LatLng(24.4248365, 54.4447807));
        getmarkers();
        _updatemarkers2();
      });
    });
  }

  _updatemarkers2() {
    Timer.periodic(Duration(seconds: 10), (t) {
      setState(() {
        carsList[2] = new Car('345', 'Engin Off - Stopped', 'driver', '160km',
            new LatLng(24.4178838, 54.4335896));
        getmarkers();
        // _updatemarkers();
      });
    });
  }

  getmarkers() {
    setState(() {
      for (int i = 0; i < carsList.length; i++) {
        String nb = carsList[i].number;
        String st = carsList[i].status;
        LatLng lt = carsList[i].location;
        String dr = carsList[i].driver;
        String sp = carsList[i].speed;
        BitmapDescriptor ic;
        if (carsList[i].status == "Engin Off - Stopped") {
          ic = redmarker;
        }
        if (carsList[i].status == "Engin On - Moving") {
          ic = greenmarker;
        }
        if (carsList[i].status == "Idiling") {
          ic = yellowmarker;
        }
        if (carsList[i].status == "Moving Out Working Hours") {
          ic = bluemarker;
        }
        if (carsList[i].status == "Not Reporting") {
          ic = greymarker;
        }

        markerlist.add(Marker(
          markerId: MarkerId("$nb"),
          icon: ic,
          infoWindow: InfoWindow(
              title: '$st',
              snippet: "Device Number : $nb \n Driver : $dr \n Speed : $sp"),
          position: lt,
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      body: Stack(children: <Widget>[
        GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
            if(!_controller.isCompleted){_controller.complete(controller);}
            getmarkers();
          },
          markers: markerlist.toSet(),
        ),
        SafeArea(
          child: Searchbarr(),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 35,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: const Radius.circular(10),
                          topLeft: Radius.circular(10))),
                  child: IconButton(
                    onPressed: _showPersBottomSheetCallBack,
                    icon: Icon(Icons.arrow_upward),
                  ),
                ),
              ],
            )
          ],
        )
      ]),
    );
  }

  static Future<void> goToTheLake(CameraPosition cp, MarkerId idd) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(cp));
    controller.showMarkerInfoWindow(idd);
  }
}
