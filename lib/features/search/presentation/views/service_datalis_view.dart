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
    required this.rate,
    required this.username,
    required this.id,
  });

  final int serviceId, rate, cost, id;
  final String serviceName, description, category, username;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RequestServiceCubit(),
      child: Scaffold(
        body: ServiceDetailsViewBody(
          rate: rate,
          username: username,
          serviceId: serviceId,
          serviceName: serviceName,
          description: description,
          category: category,
          cost: cost,
          id: id,
        ),
      ),
    );
  }
}
