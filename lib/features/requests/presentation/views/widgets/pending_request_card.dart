import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swapit/constants.dart';
import 'package:swapit/core/widgets/custom_button.dart';

class PendingRequestCard extends StatelessWidget {
  const PendingRequestCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                blurRadius: 20,
                color: Colors.grey.withOpacity(.50),
                spreadRadius: 0,
                offset: const Offset(10, 10)),
          ],
        ),
        child: const Card(
          elevation: 0,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Elctrical Repair',
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
                        Text('jan,25 2024')
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
                        Text('6:00 pm')
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Image(
                          image: AssetImage('assets/state.png'),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text('State: Pendding')
                      ],
                    )
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
                    Spacer(),
                    CustomButton(
                      label: 'Cancel',
                      backgroundColor: kGreenColor,
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
