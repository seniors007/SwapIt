import 'package:flutter/material.dart';

class CustomProfileImage extends StatelessWidget {
  const CustomProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .45,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset('assets/img4.png'), //cashed network image backage
      ),
    );
  }
}
