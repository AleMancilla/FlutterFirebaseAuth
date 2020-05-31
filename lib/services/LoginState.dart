import 'package:firebase_flutter_auth/services/AuthService.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginState with ChangeNotifier{
  bool _logstate = false;
  bool isLoggedIn() => _logstate;
  var _user ;
  SharedPreferences _pref;

  LoginState(){
    loginstate();
  }

  void loginGoogle()async {

    _user = await autService.singInWithGoogle();
    if(_user != null){
      print("__________________________________________________");
      print(_user.email);
      _pref.setBool('isloggedin', true);
      _logstate = true;
      notifyListeners();
    }else{
      _logstate = false;
      notifyListeners();
    }
  }

  void loginFacebook()async{
    _user = await autService.signInFacebook();
  print("******************************************************");
  print(_user.displayName);
    if(_user != null){
      print("__________________________________________________");
      print(_user.displayName);
      _pref.setBool('isloggedin', true);
      _logstate = true;
      notifyListeners();
    }else{
      _logstate = false;
      notifyListeners();
    }
  }

  void logout(){
    print("************SALIO DE LA CUENTA***************");
    _pref.clear();
    autService.singOutFacebook();
    autService.singOutGoogle();
    _logstate = false;
    notifyListeners();
  }

  void loginstate() async {
    _pref = await SharedPreferences.getInstance();
    if(_pref.containsKey('isloggedin')){
      _user = autService.auth.currentUser();
      _logstate = _user!= null;
      
      notifyListeners();
    }
  }
}