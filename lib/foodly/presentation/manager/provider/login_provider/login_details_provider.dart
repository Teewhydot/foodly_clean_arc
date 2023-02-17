import 'package:flutter/material.dart';

class LoginDetailsProvider extends ChangeNotifier {
  String userEmail = '';
  String userPassword = '';

  String get getEmail => userEmail;

  String get getPassword => userPassword;

  void setEmail(String email) {
    userEmail = email;
    notifyListeners();
  }

  void setPassword(String password) {
    userPassword = password;
    notifyListeners();
  }
}
