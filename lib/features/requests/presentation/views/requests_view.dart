import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swapit/features/requests/presentation/manager/current_requests_cubit/current_requests_cubit.dart';
import 'package:swapit/features/requests/presentation/views/widgets/request_view_body.dart';

class RequestsPage extends StatelessWidget {
  const RequestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => CurrentRequestsCubit(),
        child: const RequestViewBody(),
      ),
    );
  }
}
