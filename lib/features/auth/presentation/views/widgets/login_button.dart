import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swapit/constants.dart';
import 'package:swapit/features/home/presentation/views/home_view.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Get.to(() => const Homeview());
      },
      style: ElevatedButton.styleFrom(backgroundColor: kYellowColor),
      child: const Text(
        'Login',
        style: TextStyle(
          color: kWhiteColor,
          fontSize: 20,
        ),
      ),
    );
  }
}
