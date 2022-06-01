// ignore_for_file: file_names
//flutter pub run build_runner build --delete-conflicting-outputs
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';

part 'KahveModel.g.dart';

@HiveType(typeId: 1)
class KahveModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  int? isim;
  @HiveField(2)
  String? aciklama;
  @HiveField(3)
  String? resim;
  @HiveField(4)
  double? fiyat;
  @HiveField(5)
  Color? bgcolor;
} 

class Kahve {
  final String? resim, isim, aciklama;
  final int? id;
  final double? fiyat;
  final Color? bgcolor;

  Kahve({
    this.id,
    this.isim,
    this.aciklama,
    this.resim,
    this.fiyat,
    this.bgcolor,
  });
}

List<Kahve> kahveListesi = [
  Kahve(
    id: 0,
    isim: 'Caffè Americano',
    aciklama:
        'Sıcak su ile doldurulmuş espresso çekimleri, derinlik ve nüans ile bu harika zengin fincanda doruğa ulaşan hafif bir krema tabakası oluşturur.',
    fiyat: 3.99,
    resim: 'assets/images/008-coffee.png',
    bgcolor: const Color(0xFFCE9034),
  ),
  Kahve(
    id: 1,
    isim: 'Blonde Roast Americano',
    aciklama:
        "Hafif kavrulmuş kahve, yumuşak ve lezzetli. Süt, şeker veya vanilya, karamel veya fındık ile tatlandırılmış, tek başına içimi kolay ve lezzetlidir.",
    fiyat: 3.59,
    resim: 'assets/images/014-coffee-cup.png',
    bgcolor: const Color(0xFF3D82AE),
  ),
  Kahve(
    id: 2,
    isim: 'Espresso',
    aciklama:
        "Kahveler arasında içebileceğiniz en sert ve en pür kahve!",
    fiyat: 4.49,
    resim: 'assets/images/044-tea-cup.png',
    bgcolor: const Color(0xFF3D6356),
  ),
  Kahve(
    id: 3,
    isim: 'Cold Brew',
    aciklama:
        'Üzerine hafif tatlı tarçın, vanilya şurubu ve badem sütü soğuk köpüğü eklenmiş Cold Brew—süt içermeyen, 40 kalori ve lezzetli yum ile lezzetli bir şekilde paketlenmiş.',
    fiyat: 5.99,
    resim: 'assets/images/025-frappe.png',
    bgcolor: const Color(0xFFC980F2),
  ),
  Kahve(
    id: 4,
    isim: 'Cold Brew',
    aciklama:
        "Demlemeli kahveler arasında zengin ve dengeli bir kahve!",
    fiyat: 3.59,
    resim: 'assets/images/013-coffee-cup.png',
    bgcolor: const Color(0xFFDB657F),
  ),
];


