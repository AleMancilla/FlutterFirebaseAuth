import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserManagment{
  almacenarNuevoUsuario(AuthResult user,context){
    print("METODO ADICIONAR");
    print(user.user.email);
    print(user.user.providerId);
    print(user.user.uid);

    Firestore.instance.collection('/users')
    .add({
      'email':user.user.email,
      'uid':user.user.uid,
    })
    .then((valor){
      Navigator.of(context).pop();
      Navigator.of(context).pushReplacementNamed('/homePage');
    })
    .catchError((e){print(e);});
   
  }
}