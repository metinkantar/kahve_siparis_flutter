import 'package:flutter/material.dart';

class IntroSayfa extends StatelessWidget {
  final String? resim;
  final String? baslik;
  final String? icerik;
  const IntroSayfa({Key? key, this.resim, this.baslik, this.icerik})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: size.height * 0.1),
        Center(
          child: Image.network(resim!, width: 200),
        ),
        SizedBox(height: size.height * 0.1 - 50),
        Center(
          child: Text(
            baslik!,
            style: TextStyle(
              fontFamily: 'GilamBold',
              color: Colors.black87.withOpacity(0.7),
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: size.height * 0.1 - 60),
        Center(
          child: Text(
            icerik!,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'GilamBold',
              color: Colors.black87.withOpacity(0.6),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}