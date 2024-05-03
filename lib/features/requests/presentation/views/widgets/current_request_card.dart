import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:swapit/core/utils/constants.dart';
import 'package:swapit/core/widgets/custom_button.dart';
import 'package:swapit/features/requests/presentation/views/finish_service_view.dart';

class CurrentRequestCard extends StatefulWidget {
  const CurrentRequestCard({super.key});

  @override
  State<CurrentRequestCard> createState() => _CurrentRequestCardState();
}

class _CurrentRequestCardState extends State<CurrentRequestCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        height: 185,
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
            child: Row(
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Elctrical Replacemant',
                      style: TextStyle(
                        color: kYellowColor,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Elctrical',
                      style: TextStyle(
                        color: kYellowColor,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Image(
                          image: AssetImage('assets/day.png'),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text('jan,26 2024')
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Image(
                          image: AssetImage('assets/time.png'),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text('9:00 Am')
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Image(
                      image: AssetImage('assets/profile.png'),
                    ),
                    const Text(
                      'Draco M.',
                      style: TextStyle(color: kGreenColor),
                    ),
                    const Spacer(),
                    CustomButton(
                      label: "Finish",
                      backgroundColor: kYellowColor,
                      onPressed: () {
                        Get.to(() => const FinishServiceView());
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
