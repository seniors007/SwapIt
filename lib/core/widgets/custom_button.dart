import 'package:flutter/material.dart';
import 'package:swapit/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.onPressed,
      required this.label,
      required this.backgroundColor});
  final VoidCallback? onPressed;
  final String label;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
      child: Text(
        label,
        style: const TextStyle(
          color: kWhiteColor,
          fontSize: 20,
        ),
      ),
    );
  }
}
