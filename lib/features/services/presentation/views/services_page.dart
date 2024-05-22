import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swapit/features/services/presentation/manager/pending_services_cubit/pending_services_cubit.dart';
import 'package:swapit/features/services/presentation/views/widgets/service_view_body.dart';

import '../manager/current_service_cubit/current_services_cubit.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => PendingServicesCubit(),
          ),
          BlocProvider(
            create: (context) => CurrentServiceCubit(),
          ),
        ],
        child: const ServiceViewBody(),
      ),
    );
  }
}
