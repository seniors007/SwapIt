import 'package:flutter/material.dart';
import 'package:swapit/constants.dart';
import 'package:swapit/features/notification/presentation/views/widgets/notification_card_list_view.dart';

class NotificationViewBody extends StatelessWidget {
  const NotificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scrollbar(
      radius: Radius.circular(8),
      child: CustomScrollView(
        clipBehavior: Clip.none,
        physics: ClampingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Notifications',
                    style: TextStyle(
                      fontSize: 25,
                      color: kGreenColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            child: NotificationCardListView(),
          )
        ],
      ),
    );
  }
}
