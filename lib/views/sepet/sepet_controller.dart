// ignore_for_file: prefer_final_fields, unused_local_variable

import 'package:coffeapp/core/models/siparis_model.dart';
import 'package:flutter/cupertino.dart';

class SepetController extends ChangeNotifier {
  List<SiparisModel> _sepet = [];
  List<SiparisModel> get sepet => _sepet;
  late int gelenId;

  double _toplamFiyat = 0.0;
  double get toplamFiyat => _toplamFiyat;
  setToplamFiyat(double value) {
    _toplamFiyat += value;
    notifyListeners();
  }

  /*     
  double get toplamFiyat {
    double toplam = 0;
    for (var item in _sepet) {
      toplam += item.fiyat!;
    }
    return toplam;
  } 
  */

  sepeteEkle(SiparisModel model) {
    if (_sepet.isEmpty) {
      _sepet.add(model);
      setToplamFiyat(model.fiyat!);
    } else {
      var index = _sepet.indexWhere((element) => element.id == model.id);
      if (index == -1) {
        _sepet.add(model);
        setToplamFiyat(model.fiyat!);
      } else {
        _sepet[index].siparisSayisi++;
        setToplamFiyat(_sepet[index].fiyat!);
      }
    }
    notifyListeners();
  }

  sepettenCikar(SiparisModel model) {
    if (model.siparisSayisi > 1) {
      model.siparisSayisi--;
      setToplamFiyat(-model.fiyat!);
    } else {
      _sepet.remove(model);
      _toplamFiyat = 0.0;
    }
    notifyListeners();
  }

  sepetiTemizle() {
    _sepet.clear();
    _toplamFiyat = 0.0;
    notifyListeners();
  }

  /* 
  sepettenSilIdYontem1(int id) {
    var index = _sepet.indexWhere((element) => element.id == id);
    _sepet.removeAt(index);
    notifyListeners();
  }

  sepettenSilIdYontem2(int id) {
    var index = _sepet.indexWhere((element) => element.id == id);
    _sepet[index].siparisSayisi--;
    if (_sepet[index].siparisSayisi == 0) {
      _sepet.removeAt(index);
    }
    notifyListeners();
  } 
  */
}
