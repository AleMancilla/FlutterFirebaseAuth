import 'package:firebase_flutter_auth/pages/HomePage.dart';
import 'package:firebase_flutter_auth/pages/LoginPage.dart';
import 'package:firebase_flutter_auth/pages/SingUpPage.dart';
import 'package:flutter/material.dart';
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: "/loginPage",
      routes: {
        "/homePage" : (BuildContext context) => HomePage(),
        "/loginPage":(BuildContext context) => LoginPage(),
        "/singUpPage":(BuildContext context) => SingUpPage(),
      },
    );
  }
}