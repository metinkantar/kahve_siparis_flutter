// ignore_for_file: avoid_print

import 'package:coffeapp/core/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:coffeapp/core/themes/app_theme.dart';
import 'package:coffeapp/core/themes/theme_controller.dart';
import 'package:hive_flutter/hive_flutter.dart';


Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.black.withOpacity(0.7), statusBarIconBrightness: Brightness.light),
  );
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    await Firebase.initializeApp();
  } else {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyDZD_iISQxMddHTZ8IVSWfjDNGwR3SZoZQ",
        appId: "1:922144246291:android:ff8adfbfe65c32b2b44de6",
        messagingSenderId: "922144246291",
        projectId: "coffeapp-cfeaf",
      ),
    );
  }
  await Hive.initFlutter();
  await Hive.openBox('dbKutu');
  runApp(const ProviderScope(child: KahveDunyasi()));
}

class KahveDunyasi extends ConsumerWidget {
  const KahveDunyasi({Key? key}) : super(key: key);

  static const String title = 'Kahve Dünyası';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(changeTheme);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: currentTheme.darkMode ? ThemeMode.dark : ThemeMode.light,
      title: title,
      initialRoute: '/',
      routes: routes,
    );
  }
}
