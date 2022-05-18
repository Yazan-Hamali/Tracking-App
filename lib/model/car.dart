
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Car {
  String status;
  String number;
  String driver;
  String speed;
  LatLng location;

  Car(String nb, String st, String dr, String sp, LatLng lt) {
    this.number = nb;
    this.status = st;
    this.speed = sp;
    this.driver = dr;
    this.location = lt;

  }
}
