import 'package:flutter/material.dart';
import 'package:swapit/constants.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Text(
        'Available Services',
        style: TextStyle(
          fontSize: 20,
          color: kGreenColor,
        ),
      ),
    );
  }
}
