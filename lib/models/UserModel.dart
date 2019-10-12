import 'package:flutter/material.dart';

class UserModel with ChangeNotifier {
  String _name = "";
  String get name => _name;

  void inputName(String value) {
    _name = value;
    notifyListeners();
  }
}
