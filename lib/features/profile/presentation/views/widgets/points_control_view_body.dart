import 'dart:developer';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swapit/core/functions/excute_paypal_method.dart';
import 'package:swapit/core/functions/get_treansactions.dart';
import 'package:swapit/core/utils/constants.dart';
import 'package:swapit/core/widgets/custom_button.dart';
import '../../../../../core/user_controller.dart';

class PointsControlViewBody extends StatefulWidget {
  const PointsControlViewBody({super.key});

  @override
  State<PointsControlViewBody> createState() => _PointsControlViewBodyState();
}

class _PointsControlViewBodyState extends State<PointsControlViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  double moneyAmount = 100;

  int getPoints() {
    return (moneyAmount * 5).toInt();
  }

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find();

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
              height: 300,
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'Remember each point costs 0.2 \$',
                          style: TextStyle(
                            color: kYellowColor,
                            fontSize: 15,
                          ),
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Buy in With ',
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
                        Text(
                          'You will get  ${getPoints()} points',
                          style: const TextStyle(
                            color: kGreenColor,
                            fontSize: 17,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Slider(
                          thumbColor: kGreenColor,
                          activeColor: kYellowColor,
                          value: moneyAmount,
                          label: moneyAmount.round().toString(),
                          max: 1000,
                          divisions: 20,
                          onChanged: (newPoints) {
                            setState(() => moneyAmount = newPoints);
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomButton(
                          label: 'Buy in',
                          backgroundColor: kGreenColor,
                          onPressed: () {
                            var transctionsData =
                                getTransctionsData(moneyAmount.toInt());
                            excutePaypalMethod(context, transctionsData,
                                userController.userId.value, getPoints());
                          },
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
}

void deposite(int userId) async {
  try {
    var dioInstance = dio.Dio();
    dio.Response response = await dioInstance.get(
      "http://localhost:5204/api/payment/Deposite?userId=$userId&points=20",
    );
    log(response.data);
  } catch (error) {
    log('Error making GET request: $error');
  }
}
