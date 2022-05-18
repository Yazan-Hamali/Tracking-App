import 'package:et_tracking/model/car.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

List<Car> carsList = [
  Car('123', 'Engin Off - Stopped', 'driver', '160km',
      new LatLng(24.4301859, 54.419662)),
  Car('234', 'Idiling', 'driver', '160km', new LatLng(24.4338193, 54.4208863)),
  Car('345', 'Engin On - Moving', 'driver', '160km',
      new LatLng(24.4342027, 54.4296598)),
];
List<String> carsnumber = getcarsnumber();
List<String> carsdriver = getcarsdriver();

List<String> getcarsnumber() {
  final List<String> carsnumber = [];
  for (int i = 0; i < carsList.length; i++) {
    carsnumber.add(carsList[i].number);
  }
  return carsnumber;
}

List<String> getcarsdriver() {
  final List<String> carsdriver = [];
  for (int i = 0; i < carsList.length; i++) {
    carsdriver.add(carsList[i].driver);
  }
  return carsdriver;
}

int getonnum() {
  int res = 0;
  for (int i = 0; i < carsList.length; i++) {
    if (carsList[i].status == "Engin On - Moving") {
      res += 1;
    }
  }
  return res;
}
int getoffnum() {
  int res = 0;
  for (int i = 0; i < carsList.length; i++) {
    if (carsList[i].status == "Engin Off - Stopped") {
      res += 1;
    }
  }
  return res;
}
int getidinum() {
  int res = 0;
  for (int i = 0; i < carsList.length; i++) {
    if (carsList[i].status == "Idiling") {
      res += 1;
    }
  }
  return res;
}
int getwhnum() {
  int res = 0;
  for (int i = 0; i < carsList.length; i++) {
    if (carsList[i].status == "Moving Out Working Hours") {
      res += 1;
    }
  }
  return res;
}
int getnotrep() {
  int res = 0;
  for (int i = 0; i < carsList.length; i++) {
    if (carsList[i].status == "Not Reporting") {
      res += 1;
    }
  }
  return res;
}

