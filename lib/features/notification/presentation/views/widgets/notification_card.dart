import 'package:flutter/material.dart';
import 'package:swapit/core/utils/constants.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135,
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
          padding: EdgeInsets.all(16),
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
                  SizedBox(
                    width: 200,
                    child: Text(
                      'Draco has approved your request',
                      maxLines: 2,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                        color: kGreenColor,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
