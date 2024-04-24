import 'package:flutter/material.dart';
import 'package:swapit/constants.dart';

class MyPoints extends StatelessWidget {
  const MyPoints({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'My points : 1000 points',
      style: TextStyle(color: kGreenColor),
    );
  }
}
