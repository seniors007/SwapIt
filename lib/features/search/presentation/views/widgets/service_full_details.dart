import 'package:flutter/material.dart';
import 'package:swapit/core/utils/constants.dart';

class ServiceFullDetails extends StatelessWidget {
  const ServiceFullDetails({
    super.key,
    required this.serviceName,
    required this.description,
    required this.category,
    required this.cost,
  });

  final String serviceName, description, category;
  final int cost;
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Service Category:',
          style: TextStyle(
              color: kGreenColor, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          'Decoration',
          style: TextStyle(
            color: kYellowColor,
            fontSize: 20,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Service Name:',
          style: TextStyle(
              color: kGreenColor, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          'Birthday Decoration',
          style: TextStyle(
            color: kYellowColor,
            fontSize: 20,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Service Discription:',
          style: TextStyle(
              color: kGreenColor, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 225,
          child: Text(
            'For birthday Decoration this is full discription this is full discriptionthis is full discription this is full discription this is full discription',
            style: TextStyle(
              color: kYellowColor,
              fontSize: 17,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Service Cost:',
          style: TextStyle(
            color: kGreenColor,
            fontSize: 20,
          ),
        ),
        Text(
          '500 Points',
          style: TextStyle(
            color: kYellowColor,
            fontSize: 20,
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
