import 'package:coffeapp/core/controllers/karsilama_giris_controller.dart';
import 'package:coffeapp/views/anasayfa/anasayfa_controller.dart';
import 'package:coffeapp/views/anasayfa/kahve_detay_controller.dart';
import 'package:coffeapp/views/hesabim/giris_controller.dart';
import 'package:coffeapp/views/sepet/sepet_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final karsilamaProvider = ChangeNotifierProvider((ref) => KarsilamaGirisController());

final girisProvider = ChangeNotifierProvider((ref) => GirisKayitController());

final anasayfaProvider = ChangeNotifierProvider((ref) => AnaSayfaController());

final kahveDetayProvider = ChangeNotifierProvider((ref) => KahveDetayController());

final sepetProvider = ChangeNotifierProvider((ref) => SepetController());







