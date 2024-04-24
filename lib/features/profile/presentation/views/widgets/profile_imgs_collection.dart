import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:swapit/features/profile/presentation/views/widgets/custom_profile_img.dart';

class ProfileImgs extends StatelessWidget {
  const ProfileImgs({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8),
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
