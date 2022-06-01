// ignore_for_file: avoid_print

import 'package:coffeapp/core/components/intro_sayfa.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class KarsilamaGirisController extends ChangeNotifier {
  var kutu = Hive.box('dbKutu');

  final pageController = PageController(
    initialPage: 0,
    keepPage: true,
    viewportFraction: 1.0,
  );

  var _karsilamaIzlendimi = "false";
  get karsilamaIzlendimi async => await kutu.get('karsilamaIzlendimi');

  karsilamaSayfasi() async {
    _karsilamaIzlendimi = "true";
    await kutu.put('karsilamaSayfasi', _karsilamaIzlendimi);
    notifyListeners();
  }

  int _aktifSayfa = 0;
  int get aktifSayfa => _aktifSayfa;
  sayfaIndexAl(int sayfaIndex) {
    _aktifSayfa = sayfaIndex;
    notifyListeners();
    //print(_aktifSayfa);
  }

  final sayfalar = [
    const IntroSayfa(
      resim: 'https://img.icons8.com/stickers/452/coffee.png',
      baslik: 'Bitmeyen Kahve Keyfi',
      icerik:
          'İlk ve tek kahve üyelik uygulamasına hoş geldin! Kahve Dünyası ile sen de özgürce kahve içmenin tadını çıkarmaya başla.',
    ),
    const IntroSayfa(
      resim:
          'https://img.icons8.com/external-smashingstocks-flat-smashing-stocks/344/external-map-location-summer-party-smashingstocks-flat-smashing-stocks.png',
      baslik: "200'den Fazla Noktada",
      icerik:
          'Her geçen gün artan nokta sayımızla yanınızdayız! Güncel listeyi kontrol et.',
    ),
    const IntroSayfa(
      resim:
          'https://img.icons8.com/external-vitaliy-gorbachev-flat-vitaly-gorbachev/344/external-qr-code-sales-vitaliy-gorbachev-flat-vitaly-gorbachev.png',
      baslik: 'İstediğin Noktadan QR Kod ile Al.',
      icerik:
          'İster uzaktan ister mağazada siparişini ver, sana özel QR kod ile sıcacık kahveni hemen teslim al.',
    ),
    const IntroSayfa(
      resim:
          'https://img.icons8.com/external-flatart-icons-flat-flatarticons/344/external-gift-valentines-day-flatart-icons-flat-flatarticons-3.png',
      baslik: 'Hediye Kazan',
      icerik:
          'Alışverişlerin sana hediye olarak dönsün, dilediğin zaman harca!',
    ),
    const IntroSayfa(
      resim: 'https://img.icons8.com/stickers/452/mobile-shopping-bag.png',
      baslik: 'Takipte kal, yeni kampanyaları keşfet',
      icerik: 'Uygulamanı kontrol et, yeniliklerden haberdar ol!',
    ),
  ];
}
