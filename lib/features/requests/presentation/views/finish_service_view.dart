import 'package:flutter/material.dart';
import 'package:swapit/features/requests/presentation/views/widgets/finish_Service_view_body.dart';

class FinishServiceView extends StatelessWidget {
  const FinishServiceView({super.key, required this.serviceRequestId});
  final int serviceRequestId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FinishServiceViewBody(
        serviceRequestId: serviceRequestId,
      ),
    );
  }
}
