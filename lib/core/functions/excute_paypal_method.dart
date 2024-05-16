import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:swapit/core/utils/api_kyes.dart';
import 'package:swapit/core/widgets/custom_snack_bar.dart';
import 'package:swapit/features/profile/data/models/amount_model/amount_model.dart';
import 'package:swapit/features/profile/data/models/item_list_model/item_list_model.dart';

void excutePaypalMethod(BuildContext context,
    ({AmountModel amount, ItemListModel itemList}) transctionsData) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: ApiKeys.paypalClientId,
        secretKey: ApiKeys.paypalSecretId,
        transactions: [
          {
            "amount": transctionsData.amount.toJson(),
            "description": "The payment transaction description.",
            "item_list": transctionsData.itemList.toJson(),
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
          Navigator.pop(context);
          deposite();
          showSnackBar(context, 'Buy In Successfully Done ,Thank You');
        },
        onError: (error) {
          log("onError: $error");
          Navigator.pop(context);
          showSnackBar(context, 'Something Wrong Happened, try again');
        },
        onCancel: () {
          log('cancelled:');
          Navigator.pop(context);
          showSnackBar(context, 'OH, You Canceled Your Buy In');
        },
      ),
    ),
  );
}

void deposite() async {
  try {
    var dio = Dio();
    Response response = await dio.post(
      'http://localhost:5204/api/payment/Deposite',
      queryParameters: {
        'userId': 30,
        'points': 20,
      },
      options: Options(
        responseType: ResponseType.plain,
      ),
    );
    log(response.data.toString());
  } catch (error) {
    log('Error making POST request: $error');
  }
}
