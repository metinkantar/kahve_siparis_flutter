// ignore_for_file: avoid_print

import 'package:coffeapp/core/components/yonlendirme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:coffeapp/core/controllers/riverpod_management.dart';

class GirisSayfasi extends ConsumerWidget {
  const GirisSayfasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    var read = ref.read(girisProvider);
    var watch = ref.watch(girisProvider);
    User? kullaniciKontrol = FirebaseAuth.instance.currentUser;

    return kullaniciKontrol == null
        ? Scaffold(
            backgroundColor: theme.backgroundColor,
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {},
                icon:
                    const Icon(Icons.arrow_back_ios, color: Colors.transparent),
              ),
              backgroundColor: theme.backgroundColor,
              centerTitle: true,
              elevation: 0,
              title: Text(
                'Kahve Dünyası',
                style: TextStyle(
                  color: Colors.black87.withOpacity(0.7),
                  fontFamily: 'GilamSemiBold',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.0,
                ),
              ),
            ),
            body: Column(
              children: [
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    onChanged: (value) {
                      read.setKullanici = value;
                    },
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(left: 10.0),
                      fillColor: const Color.fromARGB(255, 233, 231, 228),
                      filled: true,
                      hintText: 'Kullanıcı adı ya da e-posta',
                      hintStyle: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    obscureText: watch.sifreGorunumu,
                    keyboardType: TextInputType.visiblePassword,
                    style: const TextStyle(color: Colors.black),
                    onChanged: (value) {
                      read.setParola = value;
                      read.girisButonKontrol();
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding:
                          const EdgeInsets.only(top: 14.0, left: 10.0),
                      fillColor: const Color.fromARGB(255, 233, 231, 228),
                      filled: true,
                      suffixIcon: IconButton(
                        onPressed: () {
                          read.setSifreGorunumu = !read.sifreGorunumu;
                        },
                        icon: watch.sifreGorunumu
                            ? watch.sifreGorunumAcik
                            : watch.sifreGorunumKapali,
                      ),
                      hintText: 'Parola',
                      hintStyle: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ElevatedButton(
                    onPressed: watch.butonAktifMi
                        ? () {
                            read.girisYap(
                                context, watch.kullanici, watch.parola);
                            print("Giriş Yapıldı");
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFFFF6000),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Text(
                          "GİRİŞ YAP",
                          style: TextStyle(
                            color: watch.butonAktifMi
                                ? Colors.white
                                : Colors.black.withOpacity(0.6),
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontFamily: "CodeNextBold",
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Hesabın yok mu? ",
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          fontFamily: "GilamSemiBold",
                          letterSpacing: 0.7,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, '/kayit'),
                        child: const Text(
                          "Kayıt Ol",
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            fontFamily: "GilamSemiBold",
                            letterSpacing: 0.7,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, bottom: 20.0),
                        child: ElevatedButton(
                          onPressed: () {
                            //Navigator.pushNamed(context, '/hosgeldiniz');
                            print(FirebaseAuth.instance.currentUser);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            side: BorderSide(
                              color: Colors.black.withOpacity(0.1),
                              width: 1.0,
                            ),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, bottom: 10.0),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.network(
                                    "https://img.icons8.com/fluency/344/google-logo.png",
                                    height: 26,
                                  ),
                                  const SizedBox(width: 10.0),
                                  Text(
                                    "Google ile Giriş Yap",
                                    style: TextStyle(
                                      color: Colors.black87.withOpacity(0.8),
                                      fontSize: 16.5,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "GilamSemiBold",
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        : const Yonlendirme();
  }
}
