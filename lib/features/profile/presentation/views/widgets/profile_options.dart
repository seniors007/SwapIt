import 'package:flutter/material.dart';
import 'package:swapit/core/utils/constants.dart';

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
              onPressed: () {},
              icon: const Image(
                image: AssetImage('assets/Setting.png'),
                height: 55,
              ),
            ),
            const Text(
              'Setting',
              style: TextStyle(color: kGreenColor),
            ),
          ],
        ),
        const SizedBox(
          width: 12,
        ),
        Column(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Image(
                image: AssetImage('assets/bookmark.png'),
                height: 55,
              ),
            ),
            const Text(
              'Bookmark',
              style: TextStyle(color: kGreenColor),
            ),
          ],
        ),
        const SizedBox(
          width: 12,
        ),
        Column(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Image(
                image: AssetImage('assets/logout.png'),
                height: 50,
              ),
            ),
            const Text(
              'Log out',
              style: TextStyle(color: kGreenColor),
            ),
          ],
        )
      ],
    );
  }
}
