import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pajak_app/firebase_options.dart';
import 'package:pajak_app/mobile/features/splash_screen/splash_screen_mobile.dart';
import 'package:pajak_app/website/features/login_screen/login_screen_web.dart';
import 'package:pajak_app/website/features/splash_screen/splash_screen_web.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: loadPlatform(),
    );
  }

  loadPlatform() {
    if (kIsWeb) {
      return const LoginScreenWeb();
    } else {
      return const SplashScreenMobile();
    }
  }
}
