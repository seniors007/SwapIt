import 'package:flutter/material.dart';
import 'package:swapit/constants.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Center(
        child: Text(
          message,
          style: const TextStyle(fontSize: 16),
        ),
      ),
      backgroundColor: kYellowColor,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(25),
    ),
  );
}
