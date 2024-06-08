import 'package:flutter/material.dart';
import 'package:swapit/core/utils/constants.dart';

class FinishedServiceCard extends StatelessWidget {
  const FinishedServiceCard(
      {super.key,
      required this.rate,
      required this.serviceName,
      required this.category,
      required this.username,
      required this.feedback});
  final int rate;
  final String serviceName, category, username, feedback;
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
        child: Card(
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      serviceName,
                      style: const TextStyle(
                        color: kGreenColor,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      category,
                      style: const TextStyle(
                        color: kYellowColor,
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        const Image(
                          image: AssetImage('assets/feedback.png'),
                          height: 25,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        SizedBox(
                          width: 170,
                          child: Text(
                            feedback,
                            maxLines: 1,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Image(
                      image: AssetImage('assets/profile.png'),
                    ),
                    Text(
                      username,
                      style: const TextStyle(color: kGreenColor),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '$rate',
                          style: const TextStyle(color: kGreenColor),
                        ),
                        const Image(
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
