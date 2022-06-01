import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';

class Yonlendirme extends StatefulWidget {
  const Yonlendirme({Key? key}) : super(key: key);

  @override
  State<Yonlendirme> createState() => _YonlendirmeState();
}

class _YonlendirmeState extends State<Yonlendirme> {
  @override
  void initState() {
    super.initState();
    var mikroSaniye = const Duration(microseconds: 1);

    Future.delayed(
      mikroSaniye,
      () {
        Navigator.pushReplacementNamed(context, '/');
        if (kDebugMode) {
          print('Giriş var ve yönlendirme sağlanılıyor.');
        } // Prints after 1 second.
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
