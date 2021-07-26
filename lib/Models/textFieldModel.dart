import 'package:flutter/material.dart';

class TextFieldModel extends ChangeNotifier {
  String _userPass = "";
  String _userEm = "";
  String _errorMsg = "";


  void updateUsePass(String newPas) {
    _userPass = newPas;

    notifyListeners();
  }
  get userPass => _userPass;

  void updateUserEm(String newEm) {
    _userEm = newEm;
    notifyListeners();
  }

  get userEm => _userEm;

  void updateErrorMsg(String newError) {
    _errorMsg = newError;
    notifyListeners();
  }

  get errorMsg => _errorMsg;
}