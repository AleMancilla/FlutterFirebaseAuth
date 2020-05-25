import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SingUpPage extends StatefulWidget {

  @override
  _SingUpPageState createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  String _user ;
  String _pass ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _singUp(),
      ),
    );
  }

  
  Widget _singUp(){
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
          ),
          SizedBox(height: 15.0,),
          RaisedButton(
            onPressed: (){},
            color: Colors.blue,
            textColor: Colors.white,
            child: Text("Crear Cuenta"),
            elevation: 7.0,
          ),
          SizedBox(height: 15.0,),
          Text("Ya tienes una cuenta?"),
          SizedBox(height: 10.0,),
          RaisedButton(
            onPressed: (){
              Navigator.of(context).pushNamed("/loginPage");
            },
            color: Colors.blue,
            textColor: Colors.white,
            child: Text("Inicia Session"),
            elevation: 7.0,
          ),
        ],
      ),
    );
  }
}