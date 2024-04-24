import 'package:flutter/material.dart';
import 'package:swapit/constants.dart';

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
                            color: kYellowColor,
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
                        Row(
                          children: [
                            Image(
                              image: AssetImage('assets/day.png'),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text('jan,28 2024')
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
                            Text('2:00 pm')
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Image(
                              image: AssetImage('assets/map.png'),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text('El Minya')
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
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: kYellowColor),
                      child: const Text(
                        'Accept',
                        style: TextStyle(
                          color: kWhiteColor,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: kGreenColor),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          color: kWhiteColor,
                          fontSize: 20,
                        ),
                      ),
                    )
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
