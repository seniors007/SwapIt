import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:swapit/features/profile/presentation/views/widgets/custom_profile_img.dart';

class PastWorkImgs extends StatelessWidget {
  const PastWorkImgs({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(4),
      child: Column(
        children: [
          Row(
            children: [
              CustomProfileImage(),
              SizedBox(
                width: 10,
              ),
              CustomProfileImage(),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              CustomProfileImage(),
              SizedBox(
                width: 10,
              ),
              CustomProfileImage(),
            ],
          ),
        ],
      ),
    );
  }
}
