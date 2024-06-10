import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:swapit/core/utils/constants.dart';
import 'package:swapit/features/auth/presentation/views/login_view.dart';

class ProfileOptions extends StatelessWidget {
  const ProfileOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            IconButton(
              onPressed: () {
                Get.off(() => const LoginView(),
                    transition: Transition.fadeIn,
                    duration: kTranstionDuration);
              },
              icon: const Image(
                image: AssetImage('assets/logout.png'),
                height: 50,
              ),
            ),
            const Text(
              'Log out',
              style: TextStyle(color: kGreenColor),
              textAlign: TextAlign.start,
            ),
          ],
        )
      ],
    );
  }
}
