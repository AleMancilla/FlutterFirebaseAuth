import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _user;
  String _pass;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _login(),
      ),
    );
  }

  Widget _login(){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(hintText: "Introduzca Email"),
            onChanged: (valor){
              setState(() {
                _user = valor;
              });
            },
          ),
          SizedBox(height: 15.0,),
          TextField(
            decoration: InputDecoration(hintText: "Introduzca su Contraseña"),
            onChanged: (valor){
              setState(() {
                _pass = valor;
              });
            
            },
            obscureText: true,
          ),
          SizedBox(height: 15.0,),
          RaisedButton(
            onPressed: (){
              FirebaseAuth.instance.signInWithEmailAndPassword(email: _user, password: _pass)
              .then((user){
                Navigator.of(context).pushReplacementNamed('/homePage');
              })
              .catchError((e){
                print(e);
                print ("Error de singup page ************* signInWithEmailAndPassword LOGIN");
              });
              
            },
            color: Colors.blue,
            textColor: Colors.white,
            child: Text("Inicia Session"),
            elevation: 7.0,
          ),
          SizedBox(height: 15.0,),
          Text("No tienes una cuenta?"),
          SizedBox(height: 10.0,),
          RaisedButton(
            onPressed: (){
              Navigator.of(context).pushNamed("/singUpPage");
            },
            color: Colors.blue,
            textColor: Colors.white,
            child: Text("Registrate"),
            elevation: 7.0,
          ),
        ],
      ),
    );
  }
}