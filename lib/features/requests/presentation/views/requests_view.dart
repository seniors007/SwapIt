import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swapit/features/requests/presentation/manager/current_requests_cubit/current_requests_cubit.dart';
import 'package:swapit/features/requests/presentation/manager/pending_request_cubit/pending_requests_cubit.dart';
import 'package:swapit/features/requests/presentation/views/widgets/request_view_body.dart';

import '../manager/finished_requests_cubit/finished_requests_cubit.dart';

class RequestsView extends StatelessWidget {
  const RequestsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => PendingRequestsCubit(),
          ),
          BlocProvider(
            create: (context) => CurrentRequestsCubit(),
          ),
          BlocProvider(
            create: (context) => FinishedRequestsCubit(),
          ),
        ],
        child: const RequestViewBody(),
      ),
    );
  }
}
