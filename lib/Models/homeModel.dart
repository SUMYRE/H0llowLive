import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeModel extends ChangeNotifier {

  //checks to see if the password should be visible
  get isVisible => _isVisible;
  bool _isVisible = false;
  set isVisible(value) {
    _isVisible = value;
    notifyListeners();
  }

  //checks to see if the email is valid or not, this needs to be changed to smt else
  get isValid => _isValid;
  bool _isValid = false;
  void isValidEmail(String input) {
    if (input == "example@gmail.com") {
      _isValid = true;
    }
    else {
      _isValid = false;
    }
    notifyListeners();
  }
}