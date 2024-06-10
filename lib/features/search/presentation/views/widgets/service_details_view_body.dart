import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:swapit/core/widgets/custom_button.dart';
import 'package:swapit/core/widgets/custom_snack_bar.dart';
import 'package:swapit/core/widgets/custom_text_field.dart';
import 'package:swapit/features/profile/presentation/views/widgets/past_work_imgs.dart';
import 'package:swapit/features/search/presentation/manager/request_service_cubit/request_service_cubit.dart';
import '../../../../../core/user_controller.dart';
import '../../../../../core/utils/constants.dart';

class ServiceDetailsViewBody extends StatefulWidget {
  const ServiceDetailsViewBody({
    super.key,
    required this.serviceId,
    required this.serviceName,
    required this.description,
    required this.category,
    required this.cost,
    required this.rate,
    required this.username,
    required this.id,
    this.userimage,
  });

  final int serviceId, cost, rate, id;
  final String serviceName, description, category, username;
  final String? userimage;

  @override
  State<ServiceDetailsViewBody> createState() => _ServiceDetailsViewBodyState();
}

class _ServiceDetailsViewBodyState extends State<ServiceDetailsViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? notes;
  File? requestImage;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        requestImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find();
    return BlocProvider(
      create: (_) => RequestServiceCubit(),
      child: BlocConsumer<RequestServiceCubit, RequestServiceState>(
        listener: (context, state) {
          if (state is RequestServiceSuccess) {
            if (state.success) {
              showSnackBar(context, 'Service requested successfully');
              Navigator.pop(context);
            } else {
              showSnackBar(context, 'Sorry, You don\'t have enough points');
            }
          } else if (state is RequestServiceFailure) {
            showSnackBar(context, 'Something went wrong: ${state.errMsg}');
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              widget.userimage != null
                                  ? Image.memory(
                                      base64Decode(widget.userimage!),
                                      height: 50,
                                      width: 50,
                                      fit: BoxFit.cover,
                                    )
                                  : const Image(
                                      image: AssetImage('assets/profile.png'),
                                    ),
                              SizedBox(
                                width: 70,
                                child: Text(
                                  widget.username,
                                  maxLines: 1,
                                  overflow: TextOverflow.clip,
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
                                    widget.rate.toString(),
                                    style: const TextStyle(color: kGreenColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Service Category:',
                              style: TextStyle(
                                color: kGreenColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              widget.category,
                              style: const TextStyle(
                                color: kYellowColor,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'Service Name:',
                              style: TextStyle(
                                color: kGreenColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              widget.serviceName,
                              style: const TextStyle(
                                color: kYellowColor,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'Service Description:',
                              style: TextStyle(
                                color: kGreenColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
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
                            const SizedBox(height: 20),
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
                            const SizedBox(height: 10),
                          ],
                        ),
                      ],
                    ),
                    CustomTextField(
                      label: "Notes",
                      hintText: "Leave your notes",
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(
                          RegExp(
                            r'[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}',
                          ),
                        ),
                        FilteringTextInputFormatter.deny(
                          RegExp(r'\b01[0-5]\d{8}\b'),
                        ),
                      ],
                      onChanged: (value) {
                        notes = value;
                      },
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        CustomButton(
                          onPressed: _pickImage,
                          label: 'Pick Image',
                          backgroundColor: kGreenColor,
                        ),
                        const SizedBox(width: 10),
                        if (requestImage != null)
                          Image.file(
                            requestImage!,
                            width: 100,
                            height: 100,
                          ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Spacer(),
                        CustomButton(
                          label: state is RequestServiceLoading
                              ? 'Requesting...'
                              : 'Request',
                          backgroundColor: kYellowColor,
                          onPressed: state is RequestServiceLoading
                              ? null
                              : () {
                                  if (formKey.currentState!.validate()) {
                                    final requestDate =
                                        DateTime.now().toIso8601String();
                                    const requestState = "Pending";
                                    const executionTime = 30;
                                    var customerId =
                                        userController.userId.value;

                                    BlocProvider.of<RequestServiceCubit>(
                                            context)
                                        .createServiceRequest(
                                      requestDate: requestDate,
                                      requestState: requestState,
                                      executionTime: executionTime,
                                      customerId: customerId,
                                      serviceId: widget.serviceId,
                                      notes: notes!,
                                      requestImage: requestImage,
                                    );
                                  }
                                },
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    kDivider,
                    const Text(
                      'The Service Provider Past Work:',
                      style: TextStyle(
                        color: kGreenColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    PastWorkImgs(
                      serviceProviderId: widget.id,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
