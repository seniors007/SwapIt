import 'package:flutter/material.dart';
import 'package:swapit/features/search/presentation/views/widgets/service_details_view_body.dart';

class ServiceDetailsView extends StatelessWidget {
  const ServiceDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ServiceDetailsViewBody(),
    );
  }
}
