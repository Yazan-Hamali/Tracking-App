import 'package:et_tracking/model/car.dart';
import 'package:et_tracking/view/screens/map_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../model/carslistfile.dart';

void movcam(String nb) {
  List<Car> tests = carsList.where((element) => element.number == nb).toList();
  Car c1 = tests[0];

  CameraPosition cpp = CameraPosition(
    target: c1.location,
    zoom: 19.151926040649414,
  );
  MapSampleState.goToTheLake(cpp, MarkerId("$nb"));
}
