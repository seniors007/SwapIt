import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:swapit/constants.dart';
import 'package:swapit/features/auth/presentation/views/login_view.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Get.to(() => const LoginView());
      },
      style: ElevatedButton.styleFrom(backgroundColor: kYellowColor),
      child: const Text(
        'Register',
        style: TextStyle(
          color: kWhiteColor,
          fontSize: 20,
        ),
      ),
    );
  }
}
