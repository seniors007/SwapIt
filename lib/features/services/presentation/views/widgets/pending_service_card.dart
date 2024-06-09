import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:swapit/core/utils/constants.dart';
import 'package:swapit/core/widgets/custom_button.dart';
import 'package:swapit/core/widgets/service_notes.dart';
import '../../../../../core/functions/cancel_service.dart';
import '../../../../../core/user_controller.dart';
import '../../../../../core/widgets/custom_snack_bar.dart';
import 'dart:convert';

class PendingServiceCard extends StatelessWidget {
  const PendingServiceCard({
    Key? key,
    required this.serviceName,
    required this.serviceDescription,
    required this.categoryName,
    required this.username,
    required this.notes,
    required this.serviceRequestId,
    required this.photo,
  }) : super(key: key);

  final String serviceName,
      serviceDescription,
      categoryName,
      username,
      notes,
      photo;
  final int serviceRequestId;

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        height: 350,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.grey.withOpacity(.50),
              spreadRadius: 0,
              offset: const Offset(10, 10),
            ),
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
                          categoryName,
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
                        Row(
                          children: [
                            const Icon(
                              Icons.photo,
                              color: kGreenColor,
                              size: 30,
                            ),
                            const SizedBox(width: 15),
                            SizedBox(
                              height: 100,
                              child: Image.memory(
                                base64Decode(photo),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
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
                        SizedBox(
                          width: 50,
                          child: Text(
                            username,
                            overflow: TextOverflow.clip,
                            maxLines: 1,
                            style: const TextStyle(color: kGreenColor),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      label: 'Accept',
                      backgroundColor: kYellowColor,
                      onPressed: () {
                        _acceptService(context, serviceRequestId);
                      },
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    CustomButton(
                      label: 'Cancel',
                      backgroundColor: kGreenColor,
                      onPressed: () {
                        cancelService(context, serviceRequestId,
                            userController.userId.value);
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

  Future<void> _acceptService(
      BuildContext context, int serviceRequestId) async {
    final dio.Dio _dio = dio.Dio();
    final String apiUrl =
        'http://localhost:5204/api/serviceRequests/AcceptServiceRequest?ServiceRequestId=$serviceRequestId';

    try {
      final response = await _dio.get(apiUrl);
      if (response.statusCode == 200) {
        showSnackBar(context, 'Service Accepted');
      } else {
        showSnackBar(context, 'Failed to accept service');
      }
    } catch (e) {
      showSnackBar(context, 'An error occurred');
    }
  }
}
