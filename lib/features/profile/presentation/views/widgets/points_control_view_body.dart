import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:swapit/core/functions/excute_paypal_method.dart';
import 'package:swapit/core/functions/get_treansactions.dart';
import 'package:swapit/core/utils/constants.dart';
import 'package:swapit/core/widgets/custom_button.dart';
import 'package:swapit/core/widgets/custom_text_field.dart';
import 'package:swapit/features/profile/data/models/paypal_payout_model.dart/payPal_payouts.dart';
import 'package:swapit/features/profile/data/models/paypal_payout_model.dart/payPal_service.dart';

class PointsControlViewBody extends StatefulWidget {
  const PointsControlViewBody({super.key});

  @override
  State<PointsControlViewBody> createState() => _PointsControlViewBodyState();
}

class _PointsControlViewBodyState extends State<PointsControlViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  double incash = 0;
  bool isWithdrawing = false; // Flag to indicate withdrawal in progress

  final TextEditingController withdrawalAmountController =
      TextEditingController();

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
              Text(
                'Points Control',
                style: TextStyle(
                  color: kGreenColor,
                  fontSize: 30,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Container(
              height: 270,
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
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        const Text(
                          'My Point : 1000 points',
                          style: TextStyle(
                            color: kYellowColor,
                            fontSize: 20,
                          ),
                        ),
                        const Spacer(),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'operations With ',
                              style: TextStyle(
                                color: kYellowColor,
                                fontSize: 20,
                              ),
                            ),
                            ImageIcon(
                              AssetImage('assets/paypal.png'),
                              size: 70,
                            ),
                          ],
                        ),
                        CustomTextField(
                          label: 'Amount',
                          onChanged: (data) {
                            incash = double.parse(data);
                            incash = incash / 5;
                          },
                        ),
                        // TextFormField(
                        //   controller: withdrawalAmountController,
                        //   keyboardType: TextInputType.number,
                        //   decoration: const InputDecoration(
                        //     labelText: 'Withdrawal Amount',
                        //     hintText: 'Enter Amount',
                        //   ),
                        //   validator: (value) {
                        //     if (value == null || value.isEmpty) {
                        //       return 'Please enter a withdrawal amount.';
                        //     }
                        //     return null;
                        //   },
                        // ),

                        // const SizedBox(height: 15.0),

                        // CustomButton(
                        //   backgroundColor: kGreenColor,
                        //   onPressed: triggerWithdrawal,
                        //   label: 'Withdraw',
                        // ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomButton(
                              label: 'Buy in',
                              backgroundColor: kYellowColor,
                              onPressed: () {
                                var transctionsData = getTransctionsData();
                                excutePaypalMethod(context, transctionsData);
                              },
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            CustomButton(
                                label: 'Withdraw',
                                backgroundColor: kGreenColor,
                                onPressed: () {}),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> triggerWithdrawal() async {
    if (isWithdrawing) return; // Prevent multiple simultaneous withdrawals

    setState(() {
      isWithdrawing = true; // Set flag to indicate withdrawal in progress
    });

    final withdrawalAmount =
        double.tryParse(withdrawalAmountController.text) ?? 0.0;
    if (withdrawalAmount <= 0.0) {
      // Handle invalid withdrawal amount (e.g., show an error message)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid withdrawal amount.'),
          backgroundColor: Colors.red,
        ),
      );
      setState(() {
        isWithdrawing = false; // Reset flag upon error
      });
      return;
    }

    await withdrawFunds(withdrawalAmount);

    setState(() {
      isWithdrawing = false; // Reset flag upon completion
    });
  }

  Future<void> withdrawFunds(double withdrawalAmount) async {
    // Prepare withdrawal data (assuming PayoutRequest model or similar)
    final withdrawalData = PayoutRequest(
      // Set appropriate properties based on your API requirements
      recipientType: 'EMAIL',
      receiver:
          'testbusiness123456798@business.example.com', // Replace with actual recipient email
      amount: withdrawalAmount,
      currency: 'USD',
      senderBatchHeader: '', // Replace with appropriate currency
    );

    final paypalService = PayPalPayouts(
        dio: Dio()); // Consider using a factory constructor if needed

    try {
      final response = await paypalService.createPayout(withdrawalData);
      if (response.statusCode == 201) {
        log('Withdrawal successful!');
        // Show success message to user (e.g., using a SnackBar)
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Withdrawal successful!'),
            backgroundColor: Colors.green,
          ),
        );
        // Reset form (optional)
        formKey.currentState!.reset();
        setState(() {
          incash = 0.0; // Reset withdrawal amount
        });
      } else {
        final errorData = jsonDecode(response.data);
        final errorMessage = errorData['message'] ?? 'Error during withdrawal';
        log('Error: $errorMessage');
        // Show error message to user (e.g., using a SnackBar)
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $errorMessage'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } on Exception catch (e) {
      // Handle errors thrown by createPayout or Dio
      log('Error: ${e.toString()}');
      // Show error message to user (e.g., using a SnackBar)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occurred during withdrawal.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
