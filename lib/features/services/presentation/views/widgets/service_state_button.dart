import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:group_button/group_button.dart';
import 'package:swapit/core/utils/constants.dart';
import 'package:swapit/features/services/presentation/manager/current_services_cubit/current_services_cubit.dart';
import 'package:swapit/features/services/presentation/manager/finished_services_cubit/finished_services_cubit.dart';
import 'package:swapit/features/services/presentation/manager/pending_services_cubit/pending_services_cubit.dart';
import 'package:swapit/features/services/presentation/views/widgets/current_service_card.dart';
import 'package:swapit/features/services/presentation/views/widgets/finished_service_card.dart';
import 'package:swapit/features/services/presentation/views/widgets/pending_service_card.dart';

import '../../../../../core/user_controller.dart';

class ServiceStateButton extends StatefulWidget {
  const ServiceStateButton({super.key});

  @override
  State<ServiceStateButton> createState() => _ServiceStateButtonState();
}

class _ServiceStateButtonState extends State<ServiceStateButton> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: GroupButton(
                  options: const GroupButtonOptions(
                    elevation: 5,
                    spacing: 5,
                    buttonHeight: 50,
                    buttonWidth: 115,
                    selectedColor: kGreenColor,
                    unselectedColor: kWhiteColor,
                    direction: Axis.horizontal,
                    mainGroupAlignment: MainGroupAlignment.center,
                    selectedTextStyle: TextStyle(
                      fontSize: 15,
                      color: kWhiteColor,
                    ),
                    groupingType: GroupingType.wrap,
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                    unselectedTextStyle: TextStyle(
                      color: Colors.black,
                    ),
                    selectedBorderColor: kGreenColor,
                  ),
                  isRadio: true,
                  buttons: const ["Pending", "Current", "Finished"],
                  onSelected: (value, index, isSelected) {
                    setState(() {
                      selectedIndex = index;
                    });
                    if (index == 0) {
                      BlocProvider.of<PendingServicesCubit>(context)
                          .getPendingServiceProvider(
                              serviceProviderId: userController.userId.value);
                    } else if (index == 1) {
                      BlocProvider.of<CurrentServicesCubit>(context)
                          .getCurrentServiceProvider(
                              serviceProviderId: userController.userId.value);
                    } else if (index == 2) {
                      BlocProvider.of<FinishedServicesCubit>(context)
                          .getFinishedServiceProvider(
                              serviceProviderId: userController.userId.value);
                    }
                  },
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return _buildServiceList();
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceList() {
    if (selectedIndex == 0) {
      return BlocBuilder<PendingServicesCubit, PendingServicesState>(
        builder: (context, state) {
          if (state is PendingServicesloading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PendingServicesSuccess) {
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.pendingServices.length,
              itemBuilder: (context, index) {
                final service = state.pendingServices[index];
                return PendingServiceCard(
                  photo: service.requestImage!,
                  serviceName: service.serviceName,
                  serviceDescription: service.serviceDescription,
                  categoryName: service.categoryName,
                  username: service.username,
                  notes: service.notes!,
                  serviceRequestId: service.serviceRequestId,
                );
              },
            );
          } else if (state is PendingServicesFailure) {
            return Center(child: Text(state.errMsg));
          }
          return const SizedBox();
        },
      );
    } else if (selectedIndex == 1) {
      return BlocBuilder<CurrentServicesCubit, CurrentServiceState>(
        builder: (context, state) {
          if (state is CurrentServiceLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CurrentServiceSuccess) {
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.pendingServices.length,
              itemBuilder: (context, index) {
                final service = state.pendingServices[index];
                return CurrentServiceCard(
                  photo: service.requestImage!,
                  serviceName: service.serviceName,
                  serviceDescription: service.serviceDescription,
                  categoryName: service.categoryName,
                  username: service.username,
                  notes: service.notes!,
                );
              },
            );
          } else if (state is CurrentServiceFailure) {
            return Center(child: Text(state.errMsg));
          }
          return const SizedBox();
        },
      );
    } else if (selectedIndex == 2) {
      return BlocBuilder<FinishedServicesCubit, FinishedServicesState>(
        builder: (context, state) {
          if (state is FinishedServicesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FinishedServicesSuccess) {
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.finishedServices.length,
              itemBuilder: (context, index) {
                final service = state.finishedServices[index];
                return FinishedServiceCard(
                  serviceName: service.serviceName,
                  category: service.categoryName,
                  username: service.username,
                  rate: service.totalRate,
                  feedback: service.feedback ?? '',
                );
              },
            );
          } else if (state is FinishedServicesFailure) {
            return Center(child: Text(state.errMsg));
          }
          return const SizedBox();
        },
      );
    }
    return const SizedBox();
  }
}
