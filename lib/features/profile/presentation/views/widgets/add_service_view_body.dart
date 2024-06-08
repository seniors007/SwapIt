import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:swapit/core/utils/constants.dart';
import 'package:swapit/core/widgets/custom_button.dart';
import 'package:swapit/core/widgets/custom_snack_bar.dart';
import 'package:swapit/core/widgets/custom_text_field.dart';
import 'package:swapit/features/profile/presentation/manager/add_service_cubit/add_service_cubit.dart';
import '../../../../../core/user_controller.dart';

class AddServiceViewBody extends StatefulWidget {
  const AddServiceViewBody({super.key});

  @override
  State<AddServiceViewBody> createState() => _AddServiceViewBodyState();
}

class _AddServiceViewBodyState extends State<AddServiceViewBody> {
  int _dropdownValue = 0;
  List<Map<String, dynamic>> _categories = [];
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();
  String? serviceName;
  String? serviceDescription;
  int? price;
  File? serviceImage;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    try {
      dio.Response response =
          await dio.Dio().get('http://localhost:5204/api/categories/getall');
      if (response.statusCode == 200) {
        setState(() {
          _categories = List<Map<String, dynamic>>.from(response.data);
          _dropdownValue = _categories.isNotEmpty
              ? int.parse(_categories[0]['id'].toString())
              : 0;
        });
      } else {
        throw Exception('Failed to fetch categories');
      }
    } catch (e) {
      log('Error fetching categories: $e');
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        serviceImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find();
    return BlocConsumer<AddServiceCubit, AddServiceState>(
      listener: (context, state) {
        if (state is AddServiceLoading) {
          isLoading = true;
        } else if (state is AddServiceSuccess) {
          showSnackBar(context, 'Service added');
          isLoading = false;
          Navigator.pop(context);
        } else if (state is AddServiceFailure) {
          showSnackBar(context, state.errMsg);
          isLoading = false;
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: ModalProgressHUD(
            inAsyncCall: isLoading,
            child: Center(
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        const Text(
                          textAlign: TextAlign.left,
                          'Add Service',
                          style: TextStyle(
                              color: kGreenColor,
                              fontSize: 25,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        DropdownButtonFormField<int>(
                          items: _categories
                              .map<DropdownMenuItem<int>>((category) {
                            return DropdownMenuItem<int>(
                              value: int.parse(category['id'].toString()),
                              child: Text(category['name']),
                            );
                          }).toList(),
                          value: _dropdownValue,
                          onChanged: (newValue) {
                            setState(() {
                              _dropdownValue = newValue!;
                            });
                          },
                          decoration: const InputDecoration(
                            labelText: 'Service Category',
                            labelStyle: TextStyle(color: kGreenColor),
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: kGreenColor),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        CustomTextField(
                          label: 'Service Name',
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(
                              RegExp(
                                  r'[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}'),
                            ),
                            FilteringTextInputFormatter.deny(
                              RegExp(r'\b01[0-5]\d{8}\b'),
                            ),
                          ],
                          onChanged: (value) {
                            serviceName = value;
                          },
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        CustomTextField(
                          label: 'Service Description',
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(
                              RegExp(
                                  r'[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}'),
                            ),
                            FilteringTextInputFormatter.deny(
                              RegExp(r'\b01[0-5]\d{8}\b'),
                            ),
                          ],
                          onChanged: (value) {
                            serviceDescription = value;
                          },
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        CustomTextField(
                          label: 'Price',
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            try {
                              final priceAsInt = int.tryParse(value);
                              if (priceAsInt != null) {
                                price = priceAsInt;
                              }
                            } catch (e) {
                              log('Error converting price to integer: $e');
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        _buildImagePicker(
                          'Upload Service Image',
                          serviceImage,
                          _pickImage,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        CustomButton(
                          label: 'Add',
                          backgroundColor: kYellowColor,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              if (serviceImage != null) {
                                BlocProvider.of<AddServiceCubit>(context)
                                    .addService(
                                  serviceProviderId:
                                      userController.userId.value,
                                  categoryId: _dropdownValue,
                                  serviceName: serviceName!,
                                  serviceDescription: serviceDescription!,
                                  price: price!,
                                  serviceImage: serviceImage!,
                                );
                              } else {
                                showSnackBar(
                                    context, 'Please upload a service image');
                              }
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildImagePicker(
    String label,
    File? imageFile,
    Function() onImagePicked,
  ) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              label,
              style: const TextStyle(
                color: kGreenColor,
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 10),
            IconButton(
              icon: const Icon(
                Icons.image,
                size: 50,
              ),
              onPressed: onImagePicked,
            ),
          ],
        ),
        if (imageFile != null)
          Image.file(
            imageFile,
            height: 100,
            width: 100,
          ),
      ],
    );
  }
}
