import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swapit/features/notification/presentation/views/widgets/notification_view_body.dart';
import '../manager/notification_cubit_cubit/notification_cubit_cubit.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) {
          final cubit = NotificationCubit();
          cubit.getNotifications(userId: 30);
          return cubit;
        },
        child: const NotificationViewBody(),
      ),
    );
  }
}
