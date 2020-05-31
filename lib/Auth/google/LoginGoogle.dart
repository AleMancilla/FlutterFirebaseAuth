import 'package:firebase_flutter_auth/services/AuthService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginGoogle extends StatefulWidget {
  LoginGoogle({Key key}) : super(key: key);

  @override
  _LoginGoogleState createState() => _LoginGoogleState();
}

class _LoginGoogleState extends State<LoginGoogle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Center(child:_botonGoogle())
    );
  }

  Widget _botonGoogle() {
    return Column(
      children: <Widget>[
        StreamBuilder(
          stream: autService.onGoogleCurrentUserChanged,
          builder: (BuildContext context, AsyncSnapshot<GoogleSignInAccount> snapshot){
            if(snapshot.hasData){
              return SignInButtonBuilder(
                icon: Icons.email,
                backgroundColor: Colors.blueGrey[700], 
                text: "LogOut ${snapshot.data.email}",
                onPressed: ()async{
                  await autService.singOutFacebook();
                }, 
              );
            }

            return SignInButton(
              Buttons.Google, 
              onPressed: ()async{
                await autService.signInFacebook();
              }
            );
          }
        )
      ],
    );
  }
}