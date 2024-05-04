import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:swapit/core/widgets/custom_button.dart';
import 'package:swapit/core/widgets/custom_text_field.dart';
import 'package:swapit/features/profile/presentation/views/widgets/past_work_imgs.dart';
import 'package:swapit/features/search/presentation/views/widgets/service_full_details.dart';
import '../../../../../core/utils/constants.dart';

class ServiceDetailsViewBody extends StatefulWidget {
  const ServiceDetailsViewBody({super.key});

  @override
  State<ServiceDetailsViewBody> createState() => _ServiceDetailsViewBodyState();
}

class _ServiceDetailsViewBodyState extends State<ServiceDetailsViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
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
                  SizedBox(
                    width: 16,
                  ),
                  ServiceFullDetails(),
                ],
              ),
              CustomTextField(
                label: "Notes",
                hintText: "leave your notes",
                inputFormatters: [
                  FilteringTextInputFormatter.deny(
                    RegExp(r'[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}'),
                  ),
                  FilteringTextInputFormatter.deny(
                    RegExp(r'\b01[0-5]\d{8}\b'),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Spacer(),
                  CustomButton(
                    label: 'Request',
                    backgroundColor: kYellowColor,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Get.back();
                      }
                    },
                  ),
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
