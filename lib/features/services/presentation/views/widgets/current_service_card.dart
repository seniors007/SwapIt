import 'package:flutter/material.dart';
import 'package:swapit/core/utils/constants.dart';
import 'package:swapit/core/widgets/service_notes.dart';

class CurrentServiceCard extends StatelessWidget {
  const CurrentServiceCard(
      {super.key,
      required this.serviceName,
      required this.serviceDescription,
      required this.categoryName,
      required this.username});
  final String serviceName, serviceDescription, categoryName, username;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        height: 220,
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
                      categoryName,
                      style: const TextStyle(
                        color: kYellowColor,
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const ServiceNotes()
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Image(
                      image: AssetImage('assets/profile.png'),
                    ),
                    SizedBox(
                      width: 50,
                      child: Text(
                        username,
                        maxLines: 1,
                        style: const TextStyle(color: kGreenColor),
                      ),
                    ),
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
