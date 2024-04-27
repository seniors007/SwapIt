import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:swapit/core/utils/constants.dart';
import 'package:swapit/features/requests/presentation/views/widgets/current_request_card.dart';
import 'package:swapit/features/requests/presentation/views/widgets/finished_request_card.dart';
import 'package:swapit/features/requests/presentation/views/widgets/pending_request_card.dart';

class RequestStateButton extends StatefulWidget {
  const RequestStateButton({Key? key}) : super(key: key);

  @override
  State<RequestStateButton> createState() => _RequestStateButtonState();
}

class _RequestStateButtonState extends State<RequestStateButton> {
  int selectedIndex = 0;
  List<Widget> widgets = [
    const PendingRequestCard(),
    const CurrentRequestCard(),
    const FinishedRequestCard(),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: CustomScrollView(slivers: [
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
                },
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return widgets[selectedIndex];
            },
            childCount: 9,
          ),
        ),
      ]),
    );
  }
}
