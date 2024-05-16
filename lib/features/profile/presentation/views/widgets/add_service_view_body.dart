import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:swapit/core/utils/constants.dart';
import 'package:swapit/core/widgets/custom_button.dart';
import 'package:swapit/core/widgets/custom_snack_bar.dart';
import 'package:swapit/core/widgets/custom_text_field.dart';
import 'package:swapit/features/profile/presentation/manager/cubit/add_service_cubit.dart';

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
  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    try {
      Response response =
          await Dio().get('http://localhost:5204/api/categories/getall');
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

  @override
  Widget build(BuildContext context) {
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
                          onChanged: (value) {
                            serviceName = value;
                          },
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        CustomTextField(
                          label: 'Service Description',
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
                              // Handle unexpected errors
                              print('Error converting price to integer: $e');
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        CustomButton(
                          label: 'Add',
                          backgroundColor: kYellowColor,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              BlocProvider.of<AddServiceCubit>(context)
                                  .addService(
                                      categoryId: _dropdownValue,
                                      serviceName: serviceName!,
                                      serviceDescription: serviceDescription!,
                                      price: price!);
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
}
