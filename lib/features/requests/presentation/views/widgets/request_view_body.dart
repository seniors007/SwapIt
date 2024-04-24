import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:swapit/features/requests/presentation/views/widgets/request_state_button.dart';

class RequestViewBody extends StatelessWidget {
  const RequestViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scrollbar(
      radius: Radius.circular(8),
      child: CustomScrollView(
        clipBehavior: Clip.none,
        physics: ClampingScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            child: RequestStateButton(),
          ),
        ],
      ),
    );
  }
}
