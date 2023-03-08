import 'dart:ffi';

import 'package:flutter/material.dart';

class CountryProvider extends ChangeNotifier {
  final _myController = TextEditingController();
  String _phoneCode = '91';
  String _countryCode = 'IN';
  String _phoneNumber = '';

  //Getter
  String get countryCode => _countryCode;
  String get phoneCode => _phoneCode;
  String get phoneNumber => _phoneNumber;
  bool get canSend => _phoneNumber.length >= 10;
  TextEditingController get myController => _myController;

  //Setter
  void setPhoneCode(String phoneCode) {
    _phoneCode = phoneCode;
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
