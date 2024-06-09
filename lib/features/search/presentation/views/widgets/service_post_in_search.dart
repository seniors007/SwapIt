import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swapit/core/utils/constants.dart';
import 'package:swapit/core/widgets/custom_button.dart';
import 'package:swapit/features/search/presentation/views/service_datalis_view.dart';

class ServicePostInSearch extends StatelessWidget {
  const ServicePostInSearch({
    super.key,
    required this.serviceId,
    required this.serviceName,
    required this.description,
    required this.category,
    required this.cost,
    required this.username,
    required this.rate,
    required this.id,
  });

  final int serviceId, rate, cost, id;
  final String serviceName, description, category, username;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => ServiceDetailsView(
            serviceId: serviceId,
            serviceName: serviceName,
            description: description,
            category: category,
            cost: cost,
            rate: rate,
            username: username,
            id: id,
          ),
        );
      },
      child: Container(
        height: 190,
        width: 350,
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
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 16),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Image(
                      image: AssetImage('assets/profile.png'),
                    ),
                    SizedBox(
                      width: 50,
                      child: Text(
                        maxLines: 1,
                        username,
                        style: const TextStyle(color: kGreenColor),
                      ),
                    ),
                    Row(
                      children: [
                        const Image(
                          image: AssetImage('assets/star.png'),
                          height: 20,
                          width: 20,
                        ),
                        Text(
                          '$rate',
                          style: const TextStyle(color: kGreenColor),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      serviceName,
                      style: const TextStyle(
                          color: kYellowColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      category,
                      style: const TextStyle(
                          color: kGreenColor,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 200,
                      child: Text(
                        description,
                        style: const TextStyle(
                            color: kGreenColor,
                            fontSize: 17,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    Text(
                      'Cost: $cost Points',
                      style: const TextStyle(
                        color: kGreenColor,
                        fontSize: 17,
                      ),
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 125,
                        ),
                        CustomButton(
                          label: 'Request',
                          backgroundColor: kYellowColor,
                          onPressed: () {
                            Get.to(
                              () => ServiceDetailsView(
                                serviceId: serviceId,
                                serviceName: serviceName,
                                description: description,
                                category: category,
                                cost: cost,
                                rate: rate,
                                username: username,
                                id: id,
                              ),
                            );
                          },
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
