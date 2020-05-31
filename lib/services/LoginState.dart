import 'package:flutter/material.dart';

class LoginState with ChangeNotifier{
  bool _logstate = false;
  bool isLoggedIn() => _logstate;
  void login(){
    _logstate = true;
    notifyListeners();
  }
  void logout(){
    _logstate = false;
    notifyListeners();
  }
}