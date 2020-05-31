import 'package:firebase_flutter_auth/services/AuthService.dart';
import 'package:flutter/material.dart';

class LoginState with ChangeNotifier{
  bool _logstate = false;
  bool isLoggedIn() => _logstate;

  void loginGoogle()async {

    var user = await autService.singInWithGoogle();
    if(user != null){
      print("__________________________________________________");
      print(user.email);
      _logstate = true;
      notifyListeners();
    }else{
      _logstate = false;
      notifyListeners();
    }
  }

  void loginFacebook()async{
    var user = await autService.signInFacebook();
  print("******************************************************");
  print(user.displayName);
    if(user != null){
      print("__________________________________________________");
      print(user.displayName);
      _logstate = true;
      notifyListeners();
    }else{
      _logstate = false;
      notifyListeners();
    }
  }

  void logout(){
    print("************SALIO DE LA CUENTA***************");
    autService.singOutFacebook();
    autService.singOutGoogle();
    _logstate = false;
    notifyListeners();
  }
}