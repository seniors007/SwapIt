import 'package:flutter/material.dart';
import 'package:swapit/constants.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      height: 140,
      width: 350,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              blurRadius: 20,
              color: Colors.grey.withOpacity(.50),
              spreadRadius: 0,
              offset: const Offset(10, 19)),
        ],
      ),
      child: const Card(
        elevation: 0,
        color: kWhiteColor,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(children: [
            Column(
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
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Parties Decorator',
                  style: TextStyle(
                      color: kGreenColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Modern decorations for your events',
                  style: TextStyle(
                    color: kGreenColor,
                    fontSize: 13,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Image(
                      image: AssetImage('assets/location.png'),
                      height: 20,
                      width: 20,
                    ),
                    Text(
                      'El-Minya',
                      style: TextStyle(color: kGreenColor),
                    )
                  ],
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
