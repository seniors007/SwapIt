import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_button/group_button.dart';
import 'package:swapit/core/utils/constants.dart';
import 'package:swapit/features/requests/presentation/manager/current_requests_cubit/current_requests_cubit.dart';
import 'package:swapit/features/requests/presentation/views/widgets/current_request_card.dart';

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
                    if (index == 1) {
                      BlocProvider.of<CurrentRequestsCubit>(context)
                          .getCurrentCustomerServices(customerId: 31);
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
    if (selectedIndex == 1) {
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
                  // serviceRequestId: service.serviceRequestId,
                );
              },
            );
          } else if (state is CurrentRequestsFailure) {
            return Center(child: Text(state.errMsg));
          }
          return const SizedBox();
        },
      );
    } else {
      return const SizedBox();
    }
  }
}
