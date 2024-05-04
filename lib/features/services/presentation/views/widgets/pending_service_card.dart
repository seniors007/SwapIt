import 'package:flutter/material.dart';
import 'package:swapit/core/utils/constants.dart';
import 'package:swapit/core/widgets/custom_button.dart';
import 'package:swapit/core/widgets/service_notes.dart';

class PendingServiceCard extends StatelessWidget {
  const PendingServiceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        height: 250,
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
            child: Column(
              children: [
                const Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Party Decoration',
                          style: TextStyle(
                            color: kGreenColor,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          'Decoration',
                          style: TextStyle(
                            color: kYellowColor,
                            fontSize: 17,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        ServiceNotes(),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image(
                          image: AssetImage('assets/profile.png'),
                        ),
                        Text(
                          'Draco M.',
                          style: TextStyle(color: kGreenColor),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      label: 'Accept',
                      backgroundColor: kYellowColor,
                      onPressed: () {},
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    CustomButton(
                      label: 'Cancel',
                      backgroundColor: kGreenColor,
                      onPressed: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
