import 'package:flutter/material.dart';
import 'package:swapit/core/functions/excute_paypal_method.dart';
import 'package:swapit/core/functions/get_treansactions.dart';
import 'package:swapit/core/utils/constants.dart';
import 'package:swapit/core/widgets/custom_button.dart';
import 'package:swapit/core/widgets/custom_text_field.dart';

class PointsControlViewBody extends StatefulWidget {
  const PointsControlViewBody({super.key});

  @override
  State<PointsControlViewBody> createState() => _PointsControlViewBodyState();
}

class _PointsControlViewBodyState extends State<PointsControlViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();

  double incash = 0;
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
                            incash = incash * 500;
                          },
                        ),
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
                              onPressed: () {},
                            ),
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
}
