import 'package:flutter/material.dart';
import 'package:flutter_package/flutter_package.dart';
import 'package:get/get.dart';

import 'package:pajak_app/mobile/features/splash_screen/controller/splash_screen_mobile_controller.dart';

class SplashScreenMobile extends StatelessWidget {
  const SplashScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(SplashScreenMobileController());
    return BaseWidgetContainer(
      body: const Center(
        child: Text(
          'Splashscreen mobile',
        ),
      ),
    );
  }
}
