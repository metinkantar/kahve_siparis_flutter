// ignore_for_file: must_be_immutable, use_build_context_synchronously, avoid_print

import 'package:coffeapp/core/controllers/riverpod_management.dart';
import 'package:coffeapp/views/hesabim/giris.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Hosgeldiniz extends ConsumerWidget {
  const Hosgeldiniz({Key? key}) : super(key: key);

  /*  _karsilamaSayfasi() async {
    int karsilamaSayfasi = 0;
    var kutu = Hive.box('Kutu');
    await kutu.put('karsilamaSayfasi', karsilamaSayfasi);
  }
*/
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var kutu = Hive.box('dbKutu');
    String karsilamaIzlendimi = "false";
    var size = MediaQuery.of(context).size;
    var read = ref.read(karsilamaProvider);
    var watch = ref.watch(karsilamaProvider);
    var sorgu = kutu.get('karsilamaSayfasi');
    // watch.karsilamaIzlendimi == "true" ? const GirisSayfasi() :
    return sorgu == "true" ? const GirisSayfasi() : Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.1),
            SizedBox(
              height: size.height * 0.8,
              width: size.width,
              child: PageView(
                controller: watch.pageController,
                scrollDirection: Axis.horizontal,
                onPageChanged: read.sayfaIndexAl,
                children: read.sayfalar,
              ),
            ),
            SmoothPageIndicator(
              controller: watch.pageController,
              count: read.sayfalar.length,
              onDotClicked: (index) => read.pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              ),
              effect: const WormEffect(
                dotHeight: 14,
                dotWidth: 14,
                type: WormType.thin,
                strokeWidth: 5,
              ),
            ),
            watch.aktifSayfa == 4
                ? Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, top: 10.0, right: 20.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        karsilamaIzlendimi = "true";
                        await kutu.put('karsilamaSayfasi', karsilamaIzlendimi);
                        //read.karsilamaSayfasi();
                        Navigator.pushNamed(context, '/giris');
                      },
                      style: ElevatedButton.styleFrom(
                          primary: const Color(0xFFe83939)),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 3.0, bottom: 4.0),
                          child: Text(
                            "UYGULAMAYI KEŞFET",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              fontFamily: "GilamBold",
                              letterSpacing: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: GestureDetector(
                      onTap: () {
                        print(kutu.get('karsilamaSayfasi'));
                        /*  read.pageController.animateToPage(
                          watch.sayfalar.length - 1,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.bounceOut,
                        ); */
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Tanıtımı Geç",
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w500,
                              fontFamily: "GilamBold",
                              letterSpacing: 1.0,
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios_rounded, size: 25.0),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

/* 
import 'package:flutter/material.dart';

class Hosgeldiniz extends StatelessWidget {
  const Hosgeldiniz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(),
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/images/coffee.png',
                    width: size.width * 0.4,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Kahve Dünyasına',
                      style: TextStyle(
                        fontFamily: 'CodeNextBold',
                        color: Colors.grey.shade800,
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  //SizedBox(height: size.height * 0.1 - 60),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Hosgeldiniz',
                      style: TextStyle(
                        fontFamily: 'GilamBold',
                        color: Color.fromARGB(255, 255, 190, 10),
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: size.height * 0.1 - 50),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Sıcak bir kahve içmeye ne dersin!',
                      style: TextStyle(
                        fontFamily: 'GilamBold',
                        color: Colors.grey.shade800,
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.1 - 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: const Color(0xFFFF6000)),
                      onPressed: () {
                        Navigator.pushNamed(context, '/giris');
                      },
                      child: const Center(
                        child: Text(
                          "GİRİŞ YAP",
                          style: TextStyle(
                            fontFamily: 'GilamBold',
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0.5,
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
      ),
    );
  }
} */
