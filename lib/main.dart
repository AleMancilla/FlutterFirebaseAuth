import 'package:firebase_flutter_auth/pages/HomePage.dart';
import 'package:flutter/material.dart';
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/" : (BuildContext context) => HomePage(),
      },
    );
  }
}