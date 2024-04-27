import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:swapit/core/utils/api_kyes.dart';
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
        },
        onError: (error) {
          log("onError: $error");
          Navigator.pop(context);
        },
        onCancel: () {
          log('cancelled:');
          Navigator.pop(context);
        },
      ),
    ),
  );
}
