import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:swapit/core/utils/constants.dart';
import 'package:swapit/core/cubits/search_cubit/search_cubit.dart';
import 'package:swapit/features/profile/presentation/views/widgets/add_service_button.dart';
import 'package:swapit/core/widgets/profile_information.dart';
import 'package:swapit/features/profile/presentation/views/widgets/my_points.dart';
import 'package:swapit/features/profile/presentation/views/widgets/past_work_imgs.dart';
import 'package:swapit/features/profile/presentation/views/widgets/profile_options.dart';
import 'package:swapit/features/profile/presentation/views/widgets/service_post_inProfile_list_view.dart';
import '../../../../../core/user_controller.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find();
    return Padding(
      padding: const EdgeInsets.only(left: 8, bottom: 10),
      child: Scrollbar(
        radius: const Radius.circular(8),
        child: CustomScrollView(
          clipBehavior: Clip.none,
          physics: const ClampingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ProfileInfo(),
                  const SizedBox(
                    height: 7,
                  ),
                  kDivider,
                  const SizedBox(
                    height: 7,
                  ),
                  const Text(
                    'My work',
                    style: TextStyle(color: kGreenColor),
                  ),
                  PastWorkImgs(serviceProviderId: userController.userId.value),
                  kDivider,
                  const Padding(
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
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: BlocProvider(
                create: (context) => SearchCubit()
                  ..searchService(
                      serviceName: '',
                      servicePrice: 0,
                      serviceProviderId: userController.userId.value,
                      categoryId: 0,
                      userId: 0),
                child: const ServicePostInProfileListView(),
              ),
            ),
            const SliverToBoxAdapter(
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
