import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:swapit/core/utils/constants.dart';
import 'package:swapit/features/profile/presentation/views/points_control_view.dart';

class MyPoints extends StatelessWidget {
  const MyPoints({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'My points : 1000 points',
          style: TextStyle(color: kGreenColor),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            Get.to(() => const PointsControlView());
          },
          icon: const Image(
            image: AssetImage('assets/payment.png'),
            height: 35,
          ),
        )
      ],
    );
  }
}
