import 'package:flutter/material.dart';
import 'package:swapit/core/utils/constants.dart';

class FinishedServiceCard extends StatelessWidget {
  const FinishedServiceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        height: 165,
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
                        Text('State: Done')
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
                    Row(
                      children: [
                        Image(
                          image: AssetImage('assets/star.png'),
                          height: 20,
                          width: 20,
                        ),
                        Image(
                          image: AssetImage('assets/star.png'),
                          height: 20,
                          width: 20,
                        ),
                        Image(
                          image: AssetImage('assets/star.png'),
                          height: 20,
                          width: 20,
                        ),
                        Image(
                          image: AssetImage('assets/star.png'),
                          height: 20,
                          width: 20,
                        ),
                      ],
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
