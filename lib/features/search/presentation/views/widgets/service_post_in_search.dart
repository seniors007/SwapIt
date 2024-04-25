import 'package:flutter/material.dart';
import 'package:swapit/constants.dart';
import 'package:swapit/core/widgets/custom_button.dart';

class ServicePostInSearch extends StatelessWidget {
  const ServicePostInSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 165,
      width: 350,
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
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                      Text(
                        '4.5',
                        style: TextStyle(color: kGreenColor),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Decorator',
                    style: TextStyle(
                        color: kYellowColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'For birthday Decoration',
                    style: TextStyle(
                      color: kGreenColor,
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    'Cost: 500 Points',
                    style: TextStyle(
                      color: kGreenColor,
                      fontSize: 17,
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 125,
                      ),
                      CustomButton(
                          label: 'Request', backgroundColor: kYellowColor)
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
