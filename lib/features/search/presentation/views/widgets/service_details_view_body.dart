import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swapit/core/widgets/custom_button.dart';
import 'package:swapit/features/profile/presentation/views/widgets/past_work_imgs.dart';

import '../../../../../core/utils/constants.dart';

class ServiceDetailsViewBody extends StatelessWidget {
  const ServiceDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage('assets/profile.png'),
                        ),
                        Text(
                          'Draco M.',
                          style: TextStyle(color: kGreenColor),
                        ),
                        Row(
                          children: [
                            Image(
                              image: AssetImage('assets/star.png'),
                              height: 20,
                              width: 20,
                            ),
                            Text(
                              '4.5',
                              style: TextStyle(color: kGreenColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Service Category:',
                        style: TextStyle(
                            color: kGreenColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Decoration',
                        style: TextStyle(
                          color: kYellowColor,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Service Discription:',
                        style: TextStyle(
                            color: kGreenColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 225,
                        child: Text(
                          'For birthday Decoration this is full discription this is full discriptionthis is full discription this is full discription this is full discription',
                          style: TextStyle(
                            color: kYellowColor,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Service Cost:',
                        style: TextStyle(
                          color: kGreenColor,
                          fontSize: 20,
                        ),
                      ),
                      const Text(
                        '500 Points',
                        style: TextStyle(
                          color: kYellowColor,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 100,
                          ),
                          CustomButton(
                            label: 'Request',
                            backgroundColor: kYellowColor,
                            onPressed: () {
                              Get.back();
                            },
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              kDivider,
              const Text(
                'the Service Provide Past Work:',
                style: TextStyle(
                    color: kGreenColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const PastWorkImgs()
            ],
          ),
        ),
      ),
    );
  }
}
