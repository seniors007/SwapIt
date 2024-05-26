import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swapit/core/utils/constants.dart';
import 'package:swapit/features/notification/presentation/views/widgets/notification_card.dart';
import '../../manager/notification_cubit_cubit/notification_cubit_cubit.dart';
import '../../manager/notification_cubit_cubit/notification_cubit_state.dart';

class NotificationViewBody extends StatelessWidget {
  const NotificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotificationCubitState>(
      builder: (context, state) {
        if (state is NotificationCubitLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is NotificationCubitFailure) {
          return const Center(child: Text('Check Your Internet Connection'));
        } else if (state is NotificationCubitSuccess) {
          return Scrollbar(
            radius: const Radius.circular(8),
            child: CustomScrollView(
              clipBehavior: Clip.none,
              physics: const ClampingScrollPhysics(),
              slivers: [
                const SliverToBoxAdapter(
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
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.notifications.length,
                    itemBuilder: (context, index) {
                      final notification = state.notifications[index];
                      return NotificationCard(
                        notificationType: notification.notificationType,
                        content: notification.content,
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
