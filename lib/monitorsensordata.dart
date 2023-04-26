// FirebaseDatabase database = FirebaseDatabase.instance;
// DatabaseReference ref = FirebaseDatabase.instance.ref("test/ecg");

import 'dart:async';
import 'dart:ffi';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SensorMonitor extends GetxController {
  static SensorMonitor get instance => Get.find();

  FirebaseDatabase database = FirebaseDatabase.instance;

  double dData = 0.0;
  int fData = 0;
  int eData = 0;

  late StreamSubscription<DatabaseEvent> distanceSnapshot;

  Stream <double> startDistanceMonitoring() {
    DatabaseReference ref = FirebaseDatabase.instance.ref("ESP8266WIFIPOS")
        .child("distance");

    return ref.onValue.map((distance) {
      DataSnapshot snapshot = distance.snapshot;
      dData = snapshot.value as double;


      print("Distance data in monitorsensordata.dart: $dData");
      return dData;
    });
  }

  Stream <int> startFallMonitoring() {
    DatabaseReference ref = FirebaseDatabase.instance.ref("MPU6050")
        .child("alertStatus");

    return ref.onValue.map((distance) {
      DataSnapshot snapshot = distance.snapshot;
      fData = snapshot.value as int;


      print("Fall data in monitorsensordata.dart: $fData");
      return fData;
    });
  }

  Stream <int> startECGMonitoring() {
    DatabaseReference ref = FirebaseDatabase.instance.ref("AD8032")
        .child("ecg");

    return ref.onValue.map((distance) {
      DataSnapshot snapshot = distance.snapshot;
      eData = snapshot.value as int;


      print("ECG data in monitorsensordata.dart: $eData");
      return eData;
    });
  }


}

