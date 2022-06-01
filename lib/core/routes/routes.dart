import 'package:coffeapp/views/anasayfa/anasayfa.dart';
import 'package:coffeapp/views/hesabim/giris.dart';
import 'package:coffeapp/views/hesabim/kayit.dart';
import 'package:coffeapp/views/hosgeldiniz.dart';
import 'package:coffeapp/views/sepet/sepet_drawer_menu.dart';
import 'package:coffeapp/views/siparisler/siparis_sayfa.dart';
import 'package:flutter/material.dart';

var routes = <String, WidgetBuilder>{
  "/": (context) => const AnaSayfa(),
  "/hosgeldiniz": (context) => const Hosgeldiniz(),
  "/giris": (context) => const GirisSayfasi(),
  "/kayit": (context) => const KayitSayfasi(),
  "/sepetim": (context) => const SepetWidget(),
  "/siparislerim": (context) => const SiparisSayfa(),
};
