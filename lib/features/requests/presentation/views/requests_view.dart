import 'package:flutter/material.dart';
import 'package:swapit/features/requests/presentation/views/widgets/request_view_body.dart';

class RequestsPage extends StatelessWidget {
  const RequestsPage({super.key});

  static String id = 'RequestsPage';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RequestViewBody(),
    );
  }
}
