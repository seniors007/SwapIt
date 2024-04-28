import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:swapit/core/utils/api_kyes.dart';

import 'package:swapit/features/profile/data/models/paypal_payout_model.dart/payPal_service.dart';

class PayPalPayouts {
  static const String _baseUrl = 'https://api.sandbox.paypal.com/v1/payouts';

  final Dio dio;

  PayPalPayouts(
      {required this.dio}); // Consider using a factory constructor if needed

  String generateAuthorizationHeader(String clientId, String secretKey) {
    // Base64 encode clientId:secretKey for authorization
    final credentials = '$clientId:$secretKey';
    final encodedCredentials = base64Encode(utf8.encode(credentials));
    return 'Basic $encodedCredentials';
  }

  Future<Response<dynamic>> createPayout(PayoutRequest request) async {
    final url = '$_baseUrl'; // Combine base URL with empty path

    try {
      final response = await dio.post(
        url,
        data: request.toJson(),
        options: Options(
          headers: {
            'Authorization': generateAuthorizationHeader(
              ApiKeys.paypalClientId,
              ApiKeys.paypalSecretId,
            ),
            'Content-Type': Headers.jsonContentType, // Set content type
          },
        ),
      );
      return response;
    } on DioException catch (e) {
      // Handle Dio errors more specifically
      throw Exception(
          'Payout request failed: ${e.error}'); // Consider more detailed error handling
    }
  }
}
