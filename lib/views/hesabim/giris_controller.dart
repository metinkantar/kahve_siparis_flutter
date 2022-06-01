// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GirisKayitController extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;

  PageController controller = PageController(
    initialPage: 0,
    keepPage: true,
  );

  final girisFormKey = GlobalKey<FormState>();

  String _parola = "";
  get parola => _parola;
  set setParola(String parola) {
    _parola = parola;
    notifyListeners();
  }

  String _kullanici = "";
  get kullanici => _kullanici;
  set setKullanici(String kullanici) {
    _kullanici = kullanici;
    notifyListeners();
  }

  bool _sifreGorunumu = true;
  get sifreGorunumu => _sifreGorunumu;
  set setSifreGorunumu(bool isOpen) {
    _sifreGorunumu = isOpen;
    notifyListeners();
  }

  bool _butonAktifMi = false;
  get butonAktifMi => _butonAktifMi;
  set butonAktiflestir(bool gelenDeger) {
    _butonAktifMi = gelenDeger;
    notifyListeners();
  }

  bool girisButonKontrol() {
    if (_kullanici.isEmpty || _parola.isEmpty) {
      return _butonAktifMi = false;
    } else {
      return _butonAktifMi = true;
    }
  }

  var sifreGorunumAcik = const Icon(
    Icons.visibility,
    color: Color(0xff4c5166),
  );
  var sifreGorunumKapali = const Icon(
    Icons.visibility_off,
    color: Color(0xff4c5166),
  );

  kayit(BuildContext context, String email, String password) async {
    try {
      UserCredential user = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      var kayit = await FirebaseFirestore.instance
          .collection("kullanicilar")
          .doc(user.user!.uid)
          .set({
        "id": user.user!.uid,
        "email": email,
        "password": password,
        "displayName": "",
        "photoURL":
            "https://upload.wikimedia.org/wikipedia/commons/c/cd/Portrait_Placeholder_Square.png",
        "admin": false,
      });
      Navigator.pushNamed(context, '/giris');
      return kayit;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('Sağlanan şifre çok zayıf.');
      } else if (e.code == 'email-already-in-use') {
        print('Bu e-posta için hesap zaten var.');
      }
    } catch (e) {
      print(e);
    }
  }

  girisYap(BuildContext context, String email, String password) {
    try {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email.trim(), password: password)
          .then((value) => Navigator.pushNamed(context, '/'));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('Bu e-posta için kullanıcı bulunamadı.');
      } else if (e.code == 'wrong-password') {
        // bilgi verilebilir
        print('Bu kullanıcı için yanlış şifre sağlandı.');
      }
    }
  }

  cikis(BuildContext context) async {
    await FirebaseAuth.instance.signOut().then((value) => {
          Navigator.pushNamed(context, '/giris'),
          print("Kullanıcı Çıkış Yapıldı"),
          _kullanici = "",
          _parola = "",
          _butonAktifMi = false
        });
  }
}
