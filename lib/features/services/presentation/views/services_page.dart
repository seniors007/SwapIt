import 'package:flutter/material.dart';
import 'package:swapit/features/services/presentation/views/widgets/service_view_body.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ServiceViewBody(),
    );
  }
}
