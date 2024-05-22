import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swapit/features/search/presentation/manager/request_service_cubit/request_service_cubit.dart';
import 'package:swapit/features/search/presentation/views/widgets/service_details_view_body.dart';

class ServiceDetailsView extends StatelessWidget {
  const ServiceDetailsView({
    super.key,
    required this.serviceId,
    required this.serviceName,
    required this.description,
    required this.category,
    required this.cost,
  });

  final int serviceId;
  final String serviceName, description, category;
  final int cost;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RequestServiceCubit(),
      child: Scaffold(
        body: ServiceDetailsViewBody(
          serviceId: serviceId,
          serviceName: serviceName,
          description: description,
          category: category,
          cost: cost,
        ),
      ),
    );
  }
}
