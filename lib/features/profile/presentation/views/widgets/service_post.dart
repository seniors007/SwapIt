import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:swapit/core/utils/constants.dart';
import 'package:swapit/core/widgets/custom_snack_bar.dart';

class ServicePostInProfile extends StatelessWidget {
  const ServicePostInProfile({
    super.key,
    required this.serviceName,
    required this.description,
    required this.cost,
    required this.category,
    required this.serviceid,
  });
  final String serviceName, description, category;
  final int cost, serviceid;

  Future<void> _deleteService(BuildContext context, int serviceId) async {
    try {
      var response = await Dio().get(
        'http://localhost:5204/api/services/delete?serviceId=$serviceId',
      );
      if (response.statusCode == 200) {
        showSnackBar(context, 'Service deleted successfully');
      } else {
        showSnackBar(context, 'Failed to delete service');
      }
    } catch (e) {
      log('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            children: [
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
                        fontSize: 15,
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
                        width: 215,
                      ),
                      ElevatedButton(
                          onPressed: () => _deleteService(context, serviceid),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: kYellowColor),
                          child: const Text(
                            'Delete',
                            style: TextStyle(color: kWhiteColor),
                          )),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
