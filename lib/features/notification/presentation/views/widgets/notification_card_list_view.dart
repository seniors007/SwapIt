import 'package:flutter/material.dart';
import 'package:swapit/features/notification/presentation/views/widgets/notification_card.dart';

class NotificationCardListView extends StatelessWidget {
  const NotificationCardListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const NotificationCard();
        });
  }
}
