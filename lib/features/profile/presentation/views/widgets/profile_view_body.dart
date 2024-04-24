import 'package:flutter/material.dart';
import 'package:swapit/constants.dart';
import 'package:swapit/features/profile/presentation/views/widgets/add_service_button.dart';
import 'package:swapit/features/profile/presentation/views/widgets/myPoints.dart';
import 'package:swapit/features/profile/presentation/views/widgets/profile_options.dart';
import 'package:swapit/core/widgets/profile_information.dart';
import 'package:swapit/features/profile/presentation/views/widgets/profile_imgs_collection.dart';
import 'package:swapit/features/profile/presentation/views/widgets/service_post.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scrollbar(
      radius: Radius.circular(8),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(left: 8, bottom: 10),
        clipBehavior: Clip.none,
        physics: ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileInfo(),
            kDivider,
            SizedBox(
              height: 7,
            ),
            Text(
              'My work',
              style: TextStyle(color: kGreenColor),
            ),
            ProfileImgs(),
            kDivider,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My Service',
                    style: TextStyle(color: kGreenColor),
                  ),
                  AddServiceButton()
                ],
              ),
            ),
            ServicePostInProfile(),
            ServicePostInProfile(),
            ServicePostInProfile(),
            SizedBox(height: 10),
            kDivider,
            MyPoints(),
            ProfileOptions(),
          ],
        ),
      ),
    );
  }
}
