import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:swapit/features/notification/presentation/views/widgets/notification_view_body.dart';
import '../../../../core/user_controller.dart';
import '../manager/notification_cubit_cubit/notification_cubit_cubit.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find();
    return Scaffold(
      body: BlocProvider(
        create: (context) {
          final cubit = NotificationCubit();
          cubit.getNotifications(userId: userController.userId.value);
          return cubit;
        },
        child: const NotificationViewBody(),
      ),
    );
  }
}
