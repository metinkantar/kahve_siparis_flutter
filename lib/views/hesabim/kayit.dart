import 'package:coffeapp/core/components/yonlendirme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:coffeapp/core/controllers/riverpod_management.dart';

class KayitSayfasi extends ConsumerWidget {
  const KayitSayfasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    //final size = MediaQuery.of(context).size;
    var read = ref.read(girisProvider);
    var watch = ref.watch(girisProvider);
    User? kullaniciKontrol = FirebaseAuth.instance.currentUser;

    return kullaniciKontrol == null
        ? Scaffold(
            backgroundColor: theme.backgroundColor,
            appBar: AppBar(
              backgroundColor: theme.backgroundColor,
              leading: IconButton(
                icon:
                    const Icon(Icons.arrow_back_ios, color: Colors.transparent),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
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
                      watch.setKullanici = value;
                      read.girisButonKontrol();
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
                      watch.setParola = value;
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
                            ? read.sifreGorunumAcik
                            : read.sifreGorunumKapali,
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
                    onPressed: watch.butonAktifMi ? () {} : null,
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFFFF6000),
                    ),
                    child: InkWell(
                      onTap: () {
                        read.kayit(context, watch.kullanici, watch.parola);
                      },
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Text(
                            "KAYIT OL",
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
                ),
                const SizedBox(height: 15.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Hesabın var mı? ",
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          fontFamily: "GilamSemiBold",
                          letterSpacing: 0.7,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, '/giris');
                          //Navigator.pop(context);
                        },
                        child: const Text(
                          "Giriş Yap",
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
              ],
            ),
          )
        : const Yonlendirme();
  }
}
