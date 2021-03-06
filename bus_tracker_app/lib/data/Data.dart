import 'package:bus_tracker_app/data/GetSetMarker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

List a = [
  [
    "00000",
    "สมชาย",
    "สมบัติทัวร์",
    "กรุงเทพ=>เชียงใหม่",
    true,
    LatLng(18.336334799204288, 99.22286912219779),
    "02030401"
  ],
  [
    "00001",
    "สมปอง",
    "สมบัติทัวร์",
    "กรุงเทพ=>เชียงราย",
    true,
    LatLng(19.364304705242056, 99.44204639727049),
    "02030401"
  ],
  [
    "00002",
    "โจโจ้",
    "สมบัติทัวร์",
    "กรุงเทพ=>ตราด",
    true,
    LatLng(12.52166448744181, 102.38338788164613),
    "02030401"
  ],
  [
    "00003",
    "บอย",
    "นกทัวร์",
    "กรุงเทพ=>ลำปาง",
    true,
    LatLng(18.09849443960703, 99.4896307119425),
    "02030401"
  ],
  [
    "00004",
    "บาส",
    "นกทัวร์",
    "กรุงเทพ=>ขอนแก่น",
    true,
    LatLng(16.01462392191468, 102.65916941728459),
    "02030401"
  ],
  [
    "00005",
    "แซม",
    "นกทัวร์",
    "กรุงเทพ=>มุกดาหาร",
    false,
    LatLng(16.4347455766483, 104.38092685596273),
    "02030401"
  ],
  [
    "00006",
    "สมหมาย",
    "นกทัวร์",
    "กรุงเทพ=>ยโสธร",
    true,
    LatLng(15.625068628551984, 104.24056785244746),
    "02030401"
  ],
  [
    "00007",
    "บิล",
    "นกทัวร์",
    "กรุงเทพ=>อุทัยธานี",
    true,
    LatLng(15.291019106357068, 100.07095241309752),
    "02030401"
  ],
  [
    "00008",
    "เปิ้ล",
    "นกทัวร์",
    "กรุงเทพ=>นคครสวรรค์",
    true,
    LatLng(15.511571498255597, 100.44343637770943),
    "02030401"
  ],
  [
    "00009",
    "กวง",
    "สมปองทัวร์",
    "กรุงเทพ=>ตรัง",
    true,
    LatLng(7.770180886096143, 99.49686489961121),
    "02030401"
  ],
  [
    "00010",
    "ชาติ",
    "สมปองทัวร์",
    "กรุงเทพ=>ชัยนาท",
    false,
    LatLng(15.02282259234719, 100.14317318719478),
    "02030401"
  ],
  [
    "00011",
    "หญิง",
    "สมปองทัวร์",
    "กรุงเทพ=>กระบี่",
    true,
    LatLng(8.182491798095919, 99.14296217210389),
    "02030401"
  ],
  [
    "00012",
    "ทิมมี่",
    "สมปองทัวร์",
    "กรุงเทพ=>พะเยา",
    true,
    LatLng(19.305871868671687, 99.91136661145298),
    "02030401"
  ],
  [
    "00013",
    "จอร์น",
    "สมปองทัวร์",
    "กรุงเทพ=>ลพบุรี",
    true,
    LatLng(14.750038667077117, 100.59120822124915),
    "02030401"
  ],
  [
    "00014",
    "แบงค์",
    "สมปองทัวร์",
    "กรุงเทพ=>สุพรรณบุรี",
    true,
    LatLng(14.370227127483266, 100.18040162185578),
    "02030401"
  ],
  [
    "00015",
    "อรุณ",
    "สมปองทัวร์",
    "กรุงเทพ=>นครราชศรีมา",
    false,
    LatLng(15.243119915947414, 102.52172477829133),
    "02030401"
  ],
  [
    "00016",
    "รัตน์",
    "สมปองทัวร์",
    "กรุงเทพ=>สตูล",
    true,
    LatLng(6.941950977580194, 99.99749651257044),
    "02030401"
  ],
  [
    "00017",
    "กร",
    "เทอร์โบทัวร์",
    "กรุงเทพ=>ตาก",
    true,
    LatLng(16.645542772483406, 99.23831501664272),
    "02030401"
  ],
  [
    "00018",
    "บิ๊ก",
    "เทอร์โบทัวร์",
    "กรุงเทพ=>สมุทรปราการ",
    true,
    LatLng(13.523971167525549, 100.70970003757462),
    "02030401"
  ],
  [
    "00019",
    "จีน",
    "เทอร์โบทัวร์",
    "กรุงเทพ=>อยุธยา",
    true,
    LatLng(14.434168337333896, 100.54974211843988),
    "02030401"
  ],
  [
    "00020",
    "นิว",
    "เทอร์โบทัวร์",
    "กรุงเทพ=>พิจิตร",
    true,
    LatLng(16.159616807208554, 100.39055650118254),
    "02030401"
  ],
  [
    "00021",
    "เมย์",
    "เทอร์โบทัวร์",
    "กรุงเทพ=>นครนายก",
    true,
    LatLng(14.216429020632564, 101.07776598928348),
    "02030401"
  ],
  [
    "00022",
    "ไผ่",
    "เทอร์โบทัวร์",
    "กรุงเทพ=>บึงกาฬ",
    true,
    LatLng(18.19001319910527, 103.60876014899142),
    "02030401"
  ],
  [
    "00023",
    "อาร์ม",
    "เทอร์โบทัวร์",
    "กรุงเทพ=>ชุมพร",
    false,
    LatLng(10.130093747559986, 98.96842523429407),
    "02030401"
  ],
  [
    "00024",
    "เอก",
    "รถทัวร์ซิ่ง",
    "กรุงเทพ=>นครพนม",
    true,
    LatLng(17.643108352236034, 104.2603916568474),
    "02030401"
  ],
  [
    "00025",
    "กริด",
    "รถทัวร์ซิ่ง",
    "กรุงเทพ=>นครปฐม",
    true,
    LatLng(13.862990817943636, 100.1240849075535),
    "02030401"
  ],
  [
    "00026",
    "พอล",
    "รถทัวร์ซิ่ง",
    "กรุงเทพ=>กำแพงเพชร",
    true,
    LatLng(16.125516767862223, 99.72065479245691),
    "02030401"
  ],
  [
    "00027",
    "โตโต้",
    "รถทัวร์ซิ่ง",
    "กรุงเทพ=>ฉะเชิงเทรา",
    true,
    LatLng(13.631537873571213, 101.21859507878806),
    "02030401"
  ],
  [
    "00028",
    "โกโก้",
    "รถทัวร์ซิ่ง",
    "กรุงเทพ=>นราธิวาส",
    true,
    LatLng(6.476766104974724, 101.64501802775801),
    "02030401"
  ],
];

List<GetSetMarker> prepareData(List dataList, String str) {
  List<GetSetMarker> data = [];
  for (var item in dataList) {
    if (str == "แสดงทั้งหมด") {
      data.add(GetSetMarker(
          item[0], item[1], item[2], item[3], item[4], item[5], item[6]));
    } else if (item[2] == str) {
      data.add(GetSetMarker(
          item[0], item[1], item[2], item[3], item[4], item[5], item[6]));
    }
  }
  return data;
}

List<GetSetMarker> getdata(String str) {
  return prepareData(a, str);
}

// List<GetSetMarker> prepareallData(List dataList) {
//   List<GetSetMarker> data = [];

//   for (var item in dataList) {
//     data.add(GetSetMarker(
//         item[0], item[1], item[2], item[3], item[4], item[5], item[6]));
//   }
//   return data;
// }

// List<GetSetMarker> getalldata() {
//   return prepareallData(a);
// }
