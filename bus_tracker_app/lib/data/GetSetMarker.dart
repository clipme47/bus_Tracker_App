//เก็บข้อมูลของรถแต่ละคัน
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GetSetMarker {
  String carID;
  String driverName;
  String companyName;
  String route;
  bool status;
  LatLng location;
  String phone;

//รับข้อมูลในรูปแบบList
  GetSetMarker(this.carID, this.driverName, this.companyName, this.route,
      this.status, this.location, this.phone);
}
