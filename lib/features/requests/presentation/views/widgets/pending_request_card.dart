import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:swapit/core/utils/constants.dart';
import 'package:swapit/core/widgets/custom_button.dart';
import 'package:swapit/core/widgets/service_notes.dart';
import '../../../../../core/functions/cancel_service.dart';
import '../../../../../core/user_controller.dart';

class PendingRequestCard extends StatelessWidget {
  const PendingRequestCard({
    super.key,
    required this.serviceName,
    required this.category,
    required this.notes,
    required this.userName,
    required this.requestid,
  });
  final String serviceName, category, notes, userName;
  final int requestid;
  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        height: 230,
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
                Row(
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
                          height: 5,
                        ),
                        ServiceNotes(
                          notes: notes,
                        ),
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
                          userName,
                          style: const TextStyle(color: kGreenColor),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Spacer(),
                    CustomButton(
                      label: 'Cancel',
                      backgroundColor: kGreenColor,
                      onPressed: () {
                        cancelService(
                            context, requestid, userController.userId.value);
                      },
                    ),
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
