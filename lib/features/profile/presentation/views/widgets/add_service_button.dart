import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:swapit/features/profile/presentation/views/add_serivce_view.dart';

class AddServiceButton extends StatelessWidget {
  const AddServiceButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.to(() => const AddServiceView());
      },
      icon: const Image(
        image: AssetImage('assets/plus.png'),
        height: 30,
      ),
    );
  }
}
