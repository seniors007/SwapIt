import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:swapit/core/utils/constants.dart';
import 'package:swapit/features/profile/presentation/views/points_control_view.dart';

class MyPoints extends StatefulWidget {
  const MyPoints({super.key});

  @override
  _MyPointsState createState() => _MyPointsState();
}

class _MyPointsState extends State<MyPoints> {
  int points = 0;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchPoints();
  }

  Future<void> fetchPoints() async {
    const String userId = '30';
    const String url =
        'http://localhost:5204/api/payment/MyPoints?userId=$userId';

    try {
      final response = await Dio().get(url);

      if (response.statusCode == 200) {
        setState(() {
          points = response.data;
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      log('Error fetching points: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          isLoading ? 'Loading points...' : 'My points: $points points',
          style: const TextStyle(color: kGreenColor),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            Get.to(() => const PointsControlView());
          },
          icon: const Image(
            image: AssetImage('assets/payment.png'),
            height: 35,
          ),
        ),
      ],
    );
  }
}
