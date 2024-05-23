import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:swapit/core/utils/constants.dart';
import 'package:swapit/core/widgets/custom_button.dart';
import 'package:swapit/core/widgets/service_notes.dart';
import 'package:swapit/features/requests/presentation/views/finish_service_view.dart';

class CurrentRequestCard extends StatefulWidget {
  const CurrentRequestCard(
      {super.key,
      required this.serviceName,
      required this.category,
      required this.username,
      required this.notes});
  final String serviceName, category, username, notes;
  @override
  State<CurrentRequestCard> createState() => _CurrentRequestCardState();
}

class _CurrentRequestCardState extends State<CurrentRequestCard> {
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
                      widget.serviceName,
                      style: const TextStyle(
                        color: kGreenColor,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      widget.category,
                      style: const TextStyle(
                        color: kYellowColor,
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    ServiceNotes(notes: widget.notes)
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
                      widget.username,
                      style: const TextStyle(color: kGreenColor),
                    ),
                    const Spacer(),
                    CustomButton(
                      label: "Finish",
                      backgroundColor: kYellowColor,
                      onPressed: () {
                        Get.to(() => const FinishServiceView());
                      },
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
