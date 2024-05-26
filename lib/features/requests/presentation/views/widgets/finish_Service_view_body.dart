import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:swapit/core/utils/constants.dart';
import 'package:swapit/core/widgets/custom_button.dart';
import 'package:swapit/core/widgets/custom_snack_bar.dart';

class FinishServiceViewBody extends StatefulWidget {
  const FinishServiceViewBody({super.key, required this.serviceRequestId});
  final int serviceRequestId;

  @override
  State<FinishServiceViewBody> createState() => _FinishServiceViewBodyState();
}

class _FinishServiceViewBodyState extends State<FinishServiceViewBody> {
  double rate = 1;
  bool isLoading = false;

  final Dio _dio = Dio();
  Future<void> _submitRating() async {
    setState(() {
      isLoading = true;
    });

    const String postUrl = 'http://localhost:5204/api/rates/Create';
    final String getUrl =
        'http://localhost:5204/api/serviceRequests/FinishServiceRequest?ServiceRequestId=${widget.serviceRequestId}';

    try {
      final responseGet = await _dio.get(getUrl);

      if (responseGet.statusCode == 200) {
        final requestBody = {
          "rateValue": rate.round(),
          "rateDate": DateTime.now().toIso8601String(),
          "feedback": "Your feedback here",
          "serviceId": widget.serviceRequestId,
          "customerId": 6
        };

        log('Request Body: $requestBody');

        final responsePost = await _dio.post(postUrl, data: requestBody);

        if (responsePost.statusCode == 200) {
          showSnackBar(context, "Thank you for your rating!");
        } else {
          showSnackBar(context, "Failed to submit rating");
        }
      } else {
        showSnackBar(context, "Failed to finish service request");
      }
    } catch (e) {
      showSnackBar(context, "An error occurred: $e");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

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
              SizedBox(
                width: 300,
                child: Text(
                  'How was your experience with the service?',
                  style: TextStyle(
                    color: kGreenColor,
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Container(
              height: 230,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: Colors.grey.withOpacity(0.50),
                    spreadRadius: 0,
                    offset: const Offset(10, 10),
                  ),
                ],
              ),
              child: Card(
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Your Rating',
                          style: TextStyle(color: kGreenColor, fontSize: 20),
                        ),
                        Slider(
                          thumbColor: kGreenColor,
                          activeColor: kYellowColor,
                          value: rate,
                          label: rate.round().toString(),
                          min: 1,
                          max: 5,
                          divisions: 4,
                          onChanged: (newPoints) {
                            setState(() => rate = newPoints);
                          },
                        ),
                        const SizedBox(height: 15),
                        isLoading
                            ? const CircularProgressIndicator()
                            : CustomButton(
                                label: 'Finish',
                                backgroundColor: kYellowColor,
                                onPressed: () async {
                                  await _submitRating();
                                  Get.back();
                                },
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
