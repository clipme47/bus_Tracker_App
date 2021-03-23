import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'GetSetMarker.dart';

List<GetSetMarker> getClouddata = [];

void readData() {
  Firebase.initializeApp().then((value) {
    FirebaseFirestore.instance
        .collection("busDetail")
        .snapshots()
        .listen((event) {
      for (var clouddata in event.docs) {
        Map<String, dynamic> map = clouddata.data();

        var carId = map['carId'];
        var driverName = map["driverName"];
        var companyName = map["companyName"];
        var route = map["route"];
        var status = map["status"];
        LatLng location = new LatLng(map["lat"], map["lng"]);
        var phone = map["phone"];
        getClouddata.add(GetSetMarker(
            carId, driverName, companyName, route, status, location, phone));
      }
    });
  });
}

Future<List<GetSetMarker>> getCloudData() async {
  await Firebase.initializeApp().then((value) async {
    await FirebaseFirestore.instance
        .collection("busDetail")
        .snapshots()
        .listen((event) {
      for (var clouddata in event.docs) {
        Map<String, dynamic> map = clouddata.data();

        var carId = map['carId'];
        var driverName = map["driverName"];
        var companyName = map["companyName"];
        var route = map["route"];
        var status = map["status"];
        LatLng location = new LatLng(map["lat"], map["lng"]);
        var phone = map["phone"];
        getClouddata.add(GetSetMarker(
            carId, driverName, companyName, route, status, location, phone));
      }
    });
  });
  return getClouddata;
}

void setdata() async {
  print(await getCloudData());
}
