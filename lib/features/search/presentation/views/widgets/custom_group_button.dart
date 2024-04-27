import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:swapit/core/utils/constants.dart';

class CustomGroupButton extends StatelessWidget {
  const CustomGroupButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const GroupButton(
      options: GroupButtonOptions(
        elevation: 5,
        spacing: 5,
        buttonHeight: 35,
        buttonWidth: 83,
        selectedColor: kGreenColor,
        unselectedColor: kWhiteColor,
        direction: Axis.horizontal,
        mainGroupAlignment: MainGroupAlignment.center,
        selectedTextStyle: TextStyle(
          fontSize: 15,
          color: Colors.white,
        ),
        groupingType: GroupingType.wrap,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        unselectedTextStyle: TextStyle(
          color: Colors.black,
        ),
        selectedBorderColor: kGreenColor,
      ),
      isRadio: true,
      buttons: [
        "All",
        "Delivery",
        "Decoration",
        "Electrical",
      ],
    );
  }
}
