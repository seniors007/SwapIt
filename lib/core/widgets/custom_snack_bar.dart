import 'package:flutter/material.dart';
import 'package:swapit/core/utils/constants.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              message,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          const Icon(
            Icons.check_circle,
            color: kWhiteColor,
          ),
        ],
      ),
      backgroundColor: kGreenColor,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 10,
      duration: const Duration(seconds: 3),
    ),
  );
}
