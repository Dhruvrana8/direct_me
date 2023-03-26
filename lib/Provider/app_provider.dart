import 'dart:ffi';

import 'package:flutter/material.dart';

class CustomProvider extends ChangeNotifier {
  final _myController = TextEditingController();

  String _phoneCode = '91';
  String _countryCode = 'IN';
  String _phoneNumber = '';
  bool _textInput = false;

  //Getter
  String get countryCode => _countryCode;
  String get phoneCode => _phoneCode;
  String get phoneNumber => _phoneNumber;
  bool get canSend => _phoneNumber.length >= 10;
  TextEditingController get myController => _myController;
  bool get textInput => _textInput;

  //Setter
  void setPhoneCode(String phoneCode) {
    _phoneCode = phoneCode;
    notifyListeners();
  }

  void setToggleTextInput() {
    _textInput = !_textInput;
    notifyListeners();
  }

  void setCountryCode(String countryName) {
    _countryCode = countryName;
    notifyListeners();
  }

  void setPhoneNumber(String phoneNumber) {
    _phoneNumber = phoneNumber;
    notifyListeners();
  }
}
