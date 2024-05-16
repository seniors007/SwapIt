import 'package:flutter/material.dart';
import 'package:swapit/features/profile/presentation/views/widgets/service_post.dart';

class ServicePostListView extends StatelessWidget {
  const ServicePostListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return const ServicePostInProfile();
      },
    );
  }
}
