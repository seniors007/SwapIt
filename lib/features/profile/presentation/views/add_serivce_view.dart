import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swapit/features/profile/presentation/manager/add_service_cubit/add_service_cubit.dart';
import 'package:swapit/features/profile/presentation/views/widgets/add_service_view_body.dart';

class AddServiceView extends StatelessWidget {
  const AddServiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddServiceCubit(),
      child: const Scaffold(
        body: AddServiceViewBody(),
      ),
    );
  }
}
