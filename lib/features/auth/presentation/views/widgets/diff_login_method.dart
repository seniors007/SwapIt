import 'package:flutter/material.dart';

class DiffLoginMethod extends StatelessWidget {
  const DiffLoginMethod({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.facebook,
            size: 45,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.mail,
            size: 45,
          ),
        ),
      ],
    );
  }
}
