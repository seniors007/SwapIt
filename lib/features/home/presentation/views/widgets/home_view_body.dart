import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:swapit/core/utils/constants.dart';
import 'package:swapit/core/widgets/profile_information.dart';
import 'package:swapit/core/cubits/search_cubit/search_cubit.dart';
import 'package:swapit/features/search/presentation/views/widgets/service_post_in_search.dart';
import '../../../../../core/user_controller.dart';
import '../../manager/get_user_cubit/get_user_cubit.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find();
    return BlocProvider(
      create: (context) => SearchCubit()
        ..searchService(
            serviceName: '',
            servicePrice: 0,
            serviceProviderId: 0,
            categoryId: 0,
            userId: userController.userId.value),
      child: CustomScrollView(
        clipBehavior: Clip.none,
        slivers: [
          BlocProvider(
            create: (context) =>
                GetUserCubit()..getUser(userController.userId.value),
            child: const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: ProfileInfo(),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Text(
              'Hi user \nHere what is \ngoing on today.',
              style: TextStyle(
                fontSize: 45,
                color: kYellowColor,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 5,
            ),
          ),
          const SliverToBoxAdapter(
            child: kDivider,
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 5,
            ),
          ),
          const SliverToBoxAdapter(
            child: Text(
              'Services For You',
              style: TextStyle(
                fontSize: 20,
                color: kGreenColor,
              ),
            ),
          ),
          BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              if (state is SearchLoading) {
                return const SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()),
                );
              } else if (state is SearchSuccess) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final service =
                          state.searchResponseContainer.results[index];
                      return ServicePostInSearch(
                        rate: service.totalRate!,
                        serviceId: service.id!,
                        serviceName: service.serviceName!,
                        description: service.serviceDescription!,
                        category: service.categoryName!,
                        cost: service.servicePrice!,
                        username: service.username!,
                        id: service.serviceProviderId!,
                        userImage: service.userImage,
                      );
                    },
                    childCount: state.searchResponseContainer.results.length,
                  ),
                );
              } else if (state is SearchFailure) {
                return const SliverFillRemaining(
                  child: Center(
                    child: Text("Something went wrong, try again later"),
                  ),
                );
              } else {
                return const SliverFillRemaining(
                  child: Center(
                    child: Text("Idle State"),
                  ),
                );
              }
            },
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
        ],
      ),
    );
  }
}
