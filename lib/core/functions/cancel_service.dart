import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';

import '../widgets/custom_snack_bar.dart';

Future<void> cancelService(BuildContext context, int serviceId) async {
  final dio.Dio _dio = dio.Dio();
  final String apiUrl =
      'http://localhost:5204/api/serviceRequests/CancelServiceRequest?ServiceRequestId=$serviceId&userId=31';

  try {
    final response = await _dio.get(apiUrl);
    if (response.statusCode == 200) {
      showSnackBar(context, 'Service Canceled');
    } else {
      showSnackBar(context, 'Failed to cancel service');
    }
  } catch (e) {
    showSnackBar(context, 'An error occurred: $e');
  }
}
