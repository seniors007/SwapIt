import 'package:flutter/material.dart';
import 'package:swapit/constants.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, this.onPressed});
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
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
