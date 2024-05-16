import 'package:flutter/material.dart';
import 'package:swapit/core/utils/constants.dart';
import 'package:swapit/features/profile/presentation/views/widgets/add_service_button.dart';
import 'package:swapit/core/widgets/profile_information.dart';
import 'package:swapit/features/profile/presentation/views/widgets/my_points.dart';
import 'package:swapit/features/profile/presentation/views/widgets/past_work_imgs.dart';
import 'package:swapit/features/profile/presentation/views/widgets/profile_options.dart';
import 'package:swapit/features/profile/presentation/views/widgets/service_post_list_view.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 8, bottom: 10),
      child: Scrollbar(
        radius: Radius.circular(8),
        child: CustomScrollView(
          clipBehavior: Clip.none,
          physics: ClampingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileInfo(),
                  SizedBox(
                    height: 7,
                  ),
                  kDivider,
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    'My work',
                    style: TextStyle(color: kGreenColor),
                  ),
                  PastWorkImgs(),
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

                  // SizedBox(height: 10),
                  // kDivider,
                  // MyPoints(),
                  // ProfileOptions(),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: ServicePostListView(),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  kDivider,
                  MyPoints(),
                  ProfileOptions(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
