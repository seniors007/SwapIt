import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:swapit/features/services/presentation/views/widgets/service_state_button.dart';

class ServiceViewBody extends StatelessWidget {
  const ServiceViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scrollbar(
      radius: Radius.circular(8),
      child: CustomScrollView(
        clipBehavior: Clip.none,
        physics: ClampingScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            child: ServiceStateButton(),
          ),
        ],
      ),
    );
  }
}
