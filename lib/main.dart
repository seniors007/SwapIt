import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swapit/core/utils/constants.dart';
import 'package:swapit/features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(const SwapIt());
}

class SwapIt extends StatelessWidget {
  const SwapIt({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData().copyWith(scaffoldBackgroundColor: kBackgroundColor),
      debugShowCheckedModeBanner: false,
      home: const SplashView(),
    );
  }
}
