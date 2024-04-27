import 'package:flutter/material.dart';
import 'package:swapit/core/utils/constants.dart';

class Passwordfield extends StatelessWidget {
  const Passwordfield({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // controller: _passwordController,
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: const TextStyle(
          color: kGreenColor,
          fontSize: 17,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: kGreenColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: kYellowColor),
        ),
      ),
    );
  }
}
