import 'package:flutter/material.dart';
import 'package:flutter_package/flutter_package.dart';
import 'package:pajak_app/core/utils/image_utils.dart';

class LoginScreenWeb extends StatelessWidget {
  const LoginScreenWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidgetContainer(
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: ConstantUtils.getFullWidth(context),
            height: ConstantUtils.getFullHeight(context),
            child: Image.asset(
              ImageUtils.finnanceWebBg,
              fit: BoxFit.cover,
            ),
          ),
          Container()
        ],
      ),
    );
  }
}
