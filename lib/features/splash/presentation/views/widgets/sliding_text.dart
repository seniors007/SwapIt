import 'package:flutter/material.dart';
import 'package:swapit/constants.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: slidingAnimation,
            child: const Text(
              'Where You Can Find A Hidden Gem',
              textAlign: TextAlign.center,
              style: TextStyle(color: kGreenColor, fontSize: 15),
            ),
          );
        });
  }
}
