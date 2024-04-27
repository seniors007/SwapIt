import 'package:flutter/material.dart';
import 'package:swapit/core/utils/constants.dart';
import 'package:swapit/core/widgets/custom_button.dart';

class PointsControlViewBody extends StatelessWidget {
  const PointsControlViewBody({super.key});

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
              Text(
                'Points Control',
                style: TextStyle(
                  color: kGreenColor,
                  fontSize: 30,
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
              child: Card(
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'My Point : 1000 points',
                            style: TextStyle(
                              color: kYellowColor,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'operations With ',
                            style: TextStyle(
                              color: kYellowColor,
                              fontSize: 20,
                            ),
                          ),
                          ImageIcon(
                            AssetImage('assets/paypal.png'),
                            size: 70,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomButton(
                            label: 'Accept',
                            backgroundColor: kYellowColor,
                            onPressed: () {},
                          ),
                          SizedBox(
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
          )
        ],
      ),
    );
  }
}
