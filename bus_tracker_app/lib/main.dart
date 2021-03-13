import 'package:flutter/material.dart';
import 'screens/homescreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      home: HomeScreen(),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
