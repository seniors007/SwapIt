import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swapit/core/utils/constants.dart';
import 'package:swapit/core/widgets/custom_button.dart';

class FinishServiceViewBody extends StatefulWidget {
  const FinishServiceViewBody({super.key});

  @override
  State<FinishServiceViewBody> createState() => _FinishServiceViewBodyState();
}

class _FinishServiceViewBodyState extends State<FinishServiceViewBody> {
  double points = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                child: Text(
                  'How was your experience with the service?',
                  style: TextStyle(
                    color: kGreenColor,
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Container(
              height: 230,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 20,
                      color: Colors.grey.withOpacity(.50),
                      spreadRadius: 0,
                      offset: const Offset(10, 10)),
                ],
              ),
              child: Card(
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Your Rating',
                          style: TextStyle(color: kGreenColor, fontSize: 20),
                        ),
                        Slider(
                          thumbColor: kGreenColor,
                          activeColor: kYellowColor,
                          value: points,
                          label: points.round().toString(),
                          min: 1,
                          max: 5,
                          divisions: 4,
                          onChanged: (newPoints) {
                            setState(() => points = newPoints);
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomButton(
                          label: 'Finish',
                          backgroundColor: kYellowColor,
                          onPressed: () {
                            Get.back();
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
