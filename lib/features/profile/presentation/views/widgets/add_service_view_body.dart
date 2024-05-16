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
  String _dropdownValue = '';
  List<Map<String, dynamic>> _categories = []; // Store categories here
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();

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
          _dropdownValue =
              _categories.isNotEmpty ? _categories[0]['id'].toString() : '';
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
                        DropdownButtonFormField<String>(
                          items: _categories
                              .map<DropdownMenuItem<String>>((category) {
                            return DropdownMenuItem<String>(
                              value: category['id'].toString(),
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
                        const CustomTextField(label: 'Service Name'),
                        const SizedBox(
                          height: 15.0,
                        ),
                        const CustomTextField(label: 'Service Description'),
                        const SizedBox(
                          height: 15.0,
                        ),
                        const CustomTextField(label: 'Price'),
                        const SizedBox(
                          height: 15.0,
                        ),
                        const CustomTextField(label: 'Position'),
                        const SizedBox(
                          height: 20.0,
                        ),
                        CustomButton(
                            label: 'Add',
                            backgroundColor: kYellowColor,
                            onPressed: () {
                              // if (formKey.currentState!.validate()) {
                              BlocProvider.of<AddServiceCubit>(context)
                                  .addService();
                              // }
                            })
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
