import 'package:google_maps_flutter/google_maps_flutter.dart';

class GetData {
  final String carID;
  final String driverName;
  final String companyName;
  final String route;
  final bool status;
  final LatLng location;
  final String phone;

  GetData(this.carID, this.driverName, this.companyName, this.route,
      this.status, this.location, this.phone);
}
