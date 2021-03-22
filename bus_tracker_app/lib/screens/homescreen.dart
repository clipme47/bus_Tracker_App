import 'dart:async';
import 'package:bus_tracker_app/data/Data.dart';
import 'package:bus_tracker_app/data/GetSetMarker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BitmapDescriptor normalMarker;
  BitmapDescriptor inTroubleMarker;
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> markerList = {};
  var start = "แสดงทั้งหมด";
  double screen;
  double hScreen;

  // @override
  // void initState() {
  //   super.initState();
  //   createMapMarker();
  // }

  @override
  Widget build(BuildContext context) {
    // createIntroubleMarker(context);
    createMapMarker(context);
    screen = MediaQuery.of(context).size.width;
    hScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("BusTrackingApp"),
      ),
      body: Stack(children: <Widget>[
        buildGoogleMap(start),
        buildContainerOption(start)
      ]),
      endDrawer: buildContainerofEnddraw(),
    );
  }

  GoogleMap buildGoogleMap(String str) {
    return GoogleMap(
        onMapCreated: (controller) {
          _controller.complete(controller);
          markerlist(str);
        },
        markers: Set.of(markerList),
        initialCameraPosition: CameraPosition(
          target: LatLng(13.765162, 100.538344),
          zoom: 6,
        ));
  }

  void markerlist(String str) {
    markerList.clear();
    List<GetSetMarker> data = getdata(str);
    Set<Marker> setMarker = {};
    setState(() {
      for (var item in data) {
        Marker marker = Marker(
            markerId: MarkerId(item.carID),
            position: item.location,
            icon: createMarker(item.status),
            onTap: () {
              return showModalBottomSheet(
                  context: context,
                  builder: (build) {
                    return Container(
                        height: hScreen * 0.3,
                        child: ListView(children: [
                          buildBottomCard("CarID", item.carID),
                          buildBottomCard("DriverName", item.driverName),
                          buildBottomCard("CompanyName", item.companyName),
                          buildBottomCard("Route", item.route),
                          buildBottomCard("Status", setStatus(item.status)),
                          buildPhoneCallButton(item)
                        ]));
                  });
            });

        setMarker.add(marker);
      }
      markerList = setMarker;
      print(markerList.length);
    });
  }

  void createMapMarker(context) {
    ImageConfiguration configuration = createLocalImageConfiguration(context);
    BitmapDescriptor.fromAssetImage(configuration, "assets/normal.png")
        .then((icon) {
      setState(() {
        normalMarker = icon;
      });
    });
    BitmapDescriptor.fromAssetImage(configuration, "assets/introuble.png")
        .then((icon) {
      setState(() {
        inTroubleMarker = icon;
      });
    });
  }

  BitmapDescriptor createMarker(bool status) {
    if (status == true) {
      return normalMarker;
      // return BitmapDescriptor.defaultMarkerWithHue(140);
    } else {
      return inTroubleMarker;
      // return BitmapDescriptor.defaultMarkerWithHue(0);
    }
  }

  String setStatus(bool status) {
    if (status == true) {
      return ("Normal");
    } else {
      return ("In Trouble");
    }
  }

  Container buildBottomCard(String title, String info) {
    return Container(
        color: Colors.blue[600],
        width: screen * 0.9,
        height: hScreen * 0.05,
        child: Card(
            color: Colors.blue[300],
            shadowColor: Colors.blueGrey,
            elevation: 3,
            child: Center(
              child: Text(
                "$title : $info",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            )));
  }

  Container buildPhoneCallButton(GetSetMarker item) {
    return Container(
      color: Colors.blue[600],
      width: screen * 0.9,
      height: hScreen * 0.05,
      child: Card(
        color: Colors.blue[300],
        shadowColor: Colors.blueGrey,
        elevation: 3,
        child: FlatButton(
          onPressed: () {
            phoneCall("tel:${item.phone}");
          },
          child: Text("Phone : ${item.phone}",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w400)),
        ),
      ),
    );
  }

  SafeArea buildContainerofEnddraw() {
    return SafeArea(
      child: ClipRRect(
        borderRadius: BorderRadius.horizontal(left: Radius.circular(20)),
        child: Drawer(
          child: ListView(
            children: [
              Container(
                  child: DrawerHeader(
                    child: Center(
                        child: Text(
                      "ตัวเลือกการแสดงผล",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue[400],
                  )),
              buildCard("แสดงทั้งหมด"),
              buildCard("สมบัติทัวร์"),
              buildCard("นกทัวร์"),
              buildCard("สมปองทัวร์"),
              buildCard("เทอร์โบทัวร์"),
              buildCard("รถทัวร์ซิ่ง"),
            ],
          ),
        ),
      ),
    );
  }

  Card buildCard(String str) {
    return Card(
      margin: EdgeInsets.all(10),
      shadowColor: Colors.grey,
      elevation: 1,
      child: ListTile(
        title: Text(str),
        onTap: () {
          setState(() {
            start = str;
            markerlist(start);
            Navigator.pop(context);
          });
        },
      ),
    );
  }

  Container buildContainerOption(String str) {
    return Container(
      alignment: AlignmentDirectional.topStart,
      padding: EdgeInsets.all(10),
      child: Text(str,
          style:
              TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold)),
    );
  }

  void phoneCall(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print("Cound not launch command");
    }
  }
}
