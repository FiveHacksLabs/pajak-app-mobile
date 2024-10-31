import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_package/flutter_package.dart';
import 'package:get/get.dart';
import 'package:pajak_app/website/features/splash_screen/controller/splash_screen_web_controller.dart';

class SplashScreenWeb extends StatelessWidget {
  const SplashScreenWeb({super.key});

  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(SplashScreenWebController());
    return BaseWidgetContainer(
      body: const Center(
        child: Text(
          'Splashscreen Website',
        ),
      ),
    );
  }
}
