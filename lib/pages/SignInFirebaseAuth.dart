import 'package:firebase_flutter_auth/services/LoginState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:provider/provider.dart';

class SignInFirebaseAuth extends StatelessWidget {
  const SignInFirebaseAuth({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _siginbuttons(context),
    );
  }

  _siginbuttons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:<Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buttonGoogle(context),
          _buttonFacebook(context),
        ],
      ),
      ]
    );
  }

  _buttonGoogle(BuildContext context) {
    return SignInButton(
      Buttons.Google, 
      onPressed: (){
        Provider.of<LoginState>(context).login();
      },
      text: "Iniciar Session",
    ) ;
  }

  _buttonFacebook(BuildContext context) {
    return SignInButton(
      Buttons.Facebook , 
      onPressed: (){
        Provider.of<LoginState>(context).login();
      },
      text: "Iniciar Session",
    ) ;
  }
}