import 'package:firebase_flutter_auth/Auth/correo/LoginPage.dart';
import 'package:firebase_flutter_auth/Auth/correo/SingUpPage.dart';
import 'package:firebase_flutter_auth/Auth/google/LoginGoogle.dart';
import 'package:firebase_flutter_auth/pages/HomePage.dart';
import 'package:flutter/material.dart';
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: "/LoginGoogle",
      routes: {
        "/homePage" : (BuildContext context) => HomePage(),
        "/loginPage":(BuildContext context) => LoginPage(),
        "/singUpPage":(BuildContext context) => SingUpPage(),
        "/LoginGoogle":(BuildContext context)=>LoginGoogle()
      },
    );
  }
}