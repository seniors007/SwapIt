import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:swapit/core/widgets/custom_button.dart';
import 'package:swapit/core/widgets/custom_text_field.dart';
import 'package:swapit/features/profile/presentation/views/widgets/past_work_imgs.dart';
import '../../../../../core/utils/constants.dart';

class ServiceDetailsViewBody extends StatefulWidget {
  const ServiceDetailsViewBody(
      {super.key,
      required this.serviceId,
      required this.serviceName,
      required this.description,
      required this.category,
      required this.cost});
  final int serviceId;
  final String serviceName, description, category;
  final int cost;

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
                      Text(
                        widget.category,
                        style: const TextStyle(
                          color: kYellowColor,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Service Name:',
                        style: TextStyle(
                            color: kGreenColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.serviceName,
                        style: const TextStyle(
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
                      SizedBox(
                        width: 225,
                        child: Text(
                          widget.description,
                          style: const TextStyle(
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
                      Text(
                        '${widget.cost} Points',
                        style: const TextStyle(
                          color: kYellowColor,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  )
                  // ServiceFullDetails(),
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
                      // if (formKey.currentState!.validate()) {
                      // Get.back();
                      // }
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
