import 'package:flutter/material.dart';

class KahveDetayController extends ChangeNotifier {
  List<String> sizes = ['Küçük Boy', 'Orta Boy', 'Büyük Boy'];
  List<String> dropdown1 = ['0', '1', '2(+ .25c)', '3(+ .50c)', '4(+ .75c)'];
  List<String> dropdown2 = ['0', '1', '2(+ .25c)', '3(+ .50c)', '4(+ .75c)'];
  List<String> dropdown3 = ['0', '1', '2(+ .25c)', '3(+ .50c)', '4(+ .75c)'];

  String _seciliDropdown1 = '0';
  String get seciliDropdown1 => _seciliDropdown1;
  setSeciliDropdown1(String value) {
    _seciliDropdown1 = value;
    notifyListeners();
  }

  String _seciliDropdown2 = '0';
  String get seciliDropdown2 => _seciliDropdown2;
  setSeciliDropdown2(String value) {
    _seciliDropdown2 = value;
    notifyListeners();
  }

  String _seciliDropdown3 = '0';
  String get seciliDropdown3 => _seciliDropdown3;
  setSeciliDropdown3(String value) {
    _seciliDropdown3 = value;
    notifyListeners();
  }

  int _seciliBoy = 1;
  int get seciliBoy => _seciliBoy;
  setSeciliBoy(int index) {
    _seciliBoy = index;
    notifyListeners();
  }

  String _seciliBoyString = "Orta Boy";
  String get seciliBoyString => _seciliBoyString;
  setSeciliBoyString(String value) {
    _seciliBoyString = value;
    notifyListeners();
  }

  int _siparisSayisi = 1;
  int get siparisSayisi => _siparisSayisi;

  adetSayisiKontrol() {
    if (_siparisSayisi >= 10) {
      _siparisSayisi = 9;
    }
    if (_siparisSayisi <= 0) {
      _siparisSayisi = 1;
    }
  }

  setSiparisSayisi() {
    _siparisSayisi++;
    adetSayisiKontrol();
    notifyListeners();
  }

  unsetSiparisSayisi() {
    _siparisSayisi--;
    adetSayisiKontrol();
    notifyListeners();
  }
}
