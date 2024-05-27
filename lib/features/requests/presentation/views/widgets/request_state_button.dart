import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_button/group_button.dart';
import 'package:swapit/core/utils/constants.dart';
import 'package:swapit/features/requests/presentation/manager/current_requests_cubit/current_requests_cubit.dart';
import 'package:swapit/features/requests/presentation/manager/finished_requests_cubit/finished_requests_cubit.dart';
import 'package:swapit/features/requests/presentation/manager/pending_request_cubit/pending_requests_cubit.dart';
import 'package:swapit/features/requests/presentation/manager/pending_request_cubit/pending_requests_state.dart';
import 'package:swapit/features/requests/presentation/views/widgets/current_request_card.dart';
import 'package:swapit/features/requests/presentation/views/widgets/finished_request_card.dart';
import 'package:swapit/features/requests/presentation/views/widgets/pending_request_card.dart';

import '../../manager/finished_requests_cubit/finished_requests_state.dart';

class RequestStateButton extends StatefulWidget {
  const RequestStateButton({super.key});

  @override
  State<RequestStateButton> createState() => _RequestStateButtonState();
}

class _RequestStateButtonState extends State<RequestStateButton> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
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
                  buttons: const [
                    "Pending",
                    "Current",
                    "Finished",
                  ],
                  onSelected: (value, index, isSelected) {
                    setState(() {
                      selectedIndex = index;
                    });
                    if (index == 0) {
                      BlocProvider.of<PendingRequestsCubit>(context)
                          .getPendingRequests(customerId: 34);
                    } else if (index == 1) {
                      BlocProvider.of<CurrentRequestsCubit>(context)
                          .getCurrentCustomerServices(customerId: 34);
                    } else if (index == 2) {
                      BlocProvider.of<FinishedRequestsCubit>(context)
                          .getFinishedCustomerServices(customerId: 34);
                    }
                  },
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return _buildRequestList();
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRequestList() {
    if (selectedIndex == 0) {
      return BlocBuilder<PendingRequestsCubit, PendingRequestsState>(
        builder: (context, state) {
          if (state is PendingRequestsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PendingRequestsSuccess) {
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.pendingRequests.length,
              itemBuilder: (context, index) {
                final service = state.pendingRequests[index];
                return PendingRequestCard(
                  serviceName: service.serviceName,
                  category: service.categoryName,
                  userName: service.username,
                  notes: service.notes!,
                  requestid: service.serviceRequestId,
                );
              },
            );
          } else if (state is PendingRequestsFailure) {
            return const Center(child: Text("An Error Occured"));
          }
          return const SizedBox();
        },
      );
    } else if (selectedIndex == 1) {
      return BlocBuilder<CurrentRequestsCubit, CurrentRequestsState>(
        builder: (context, state) {
          if (state is CurrentRequestsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CurrentRequestsSuccess) {
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.currentServices.length,
              itemBuilder: (context, index) {
                final service = state.currentServices[index];
                return CurrentRequestCard(
                  serviceName: service.serviceName,
                  category: service.categoryName,
                  username: service.username,
                  notes: service.notes!,
                  serviceRequestId: service.serviceRequestId,
                );
              },
            );
          } else if (state is CurrentRequestsFailure) {
            return const Center(child: Text("An Error Occured"));
          }
          return const SizedBox();
        },
      );
    } else if (selectedIndex == 2) {
      return BlocBuilder<FinishedRequestsCubit, FinishedRequestsState>(
        builder: (context, state) {
          if (state is FinishedRequestsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FinishedRequestsSuccess) {
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.finishedRequests.length,
              itemBuilder: (context, index) {
                final service = state.finishedRequests[index];
                return FinishedRequestCard(
                  serviceName: service.serviceName,
                  category: service.categoryName,
                  username: service.username,
                  rate: service.totalRate,
                );
              },
            );
          } else if (state is FinishedRequestsFailure) {
            return const Center(child: Text("An Error Occured"));
          }
          return const SizedBox();
        },
      );
    } else {
      return const SizedBox();
    }
  }
}
