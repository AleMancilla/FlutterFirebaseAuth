import 'package:firebase_flutter_auth/Auth/correo/LoginPage.dart';
import 'package:firebase_flutter_auth/Auth/correo/SingUpPage.dart';
import 'package:firebase_flutter_auth/Auth/google/LoginGoogle.dart';
import 'package:firebase_flutter_auth/pages/HomePage.dart';
import 'package:firebase_flutter_auth/pages/SignInFirebaseAuth.dart';
import 'package:firebase_flutter_auth/services/LoginState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginState>(
      builder: (BuildContext context)=>LoginState(),
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        initialRoute: "/signIn",
        routes: {
          "/signIn":(BuildContext context){
            var state = Provider.of<LoginState>(context);
            if(state.isLoggedIn())
            {
              return HomePage();
            }else{
              return SignInFirebaseAuth();
            }
          },
          "/homePage" : (BuildContext context) => HomePage(),
          "/loginPage":(BuildContext context) => LoginPage(),
          "/singUpPage":(BuildContext context) => SingUpPage(),
          "/LoginGoogle":(BuildContext context)=>LoginGoogle(),
        },
      ),
    );
  }
}