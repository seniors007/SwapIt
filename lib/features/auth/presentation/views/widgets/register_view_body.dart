import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:swapit/core/utils/constants.dart';
import 'package:swapit/core/widgets/custom_button.dart';
import 'package:swapit/core/widgets/custom_snack_bar.dart';
import 'package:swapit/core/widgets/custom_text_field.dart';
import 'package:swapit/features/auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:swapit/features/auth/presentation/views/login_view.dart';
import 'package:swapit/features/auth/presentation/views/viewModels/resister_data.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  String dropdownGendervalue = 'Male';

  GlobalKey<FormState> formKey = GlobalKey();

  final registerdata = RegisterData();

  bool isLoading = false;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(Function(File) onImagePicked) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      onImagePicked(File(pickedFile.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          setState(() {
            isLoading = true;
          });
        } else if (state is RegisterSuccess) {
          Get.to(() => const LoginView());
          showSnackBar(context, 'Register Successful');
          setState(() {
            isLoading = false;
          });
        } else if (state is RegisterFailure) {
          showSnackBar(context, state.errMsg);
          setState(() {
            isLoading = false;
          });
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: ModalProgressHUD(
            inAsyncCall: isLoading,
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                textAlign: TextAlign.left,
                                'Register',
                                style: TextStyle(
                                    color: kGreenColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomTextField(
                            label: 'User Name',
                            onChanged: (data) {
                              registerdata.userName = data;
                            },
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          CustomTextField(
                            label: 'Email',
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (value) {
                              registerdata.email = value;
                            },
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          CustomTextField(
                            label: 'Password',
                            onChanged: (data) {
                              registerdata.password = data;
                            },
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            children: [
                              CustomTextField(
                                label: 'Birth Year',
                                width: 150,
                                keyboardType: TextInputType.datetime,
                                onChanged: (value) {
                                  registerdata.birthYear = value;
                                },
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              CustomTextField(
                                label: 'Month',
                                width: 75,
                                keyboardType: TextInputType.datetime,
                                onChanged: (value) {
                                  registerdata.birthMonth = value;
                                },
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              CustomTextField(
                                label: 'Day',
                                width: 75,
                                keyboardType: TextInputType.datetime,
                                onChanged: (value) {
                                  registerdata.birthDay = value;
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          const Row(
                            children: [
                              Text(
                                'Gender',
                                style: TextStyle(
                                    color: kGreenColor,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          DropdownButton(
                            items: const [
                              DropdownMenuItem(
                                value: 'Male',
                                child: Text('Male'),
                              ),
                              DropdownMenuItem(
                                value: 'Female',
                                child: Text('Female'),
                              ),
                            ],
                            value: dropdownGendervalue,
                            onChanged: dropdownCallback,
                            iconSize: 50,
                            isExpanded: true,
                            iconDisabledColor: kYellowColor,
                            iconEnabledColor: kGreenColor,
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          CustomTextField(
                            label: 'Phone Number',
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              registerdata.phoneNumber = value;
                            },
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          CustomTextField(
                            label: 'Job Title',
                            onChanged: (value) {
                              registerdata.jobTitle = value;
                            },
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          CustomTextField(
                            label: 'Address',
                            onChanged: (value) {
                              registerdata.address = value;
                            },
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          _buildImagePicker(
                            'Upload Profile Image',
                            registerdata.profileImage,
                            (File image) {
                              setState(() {
                                registerdata.profileImage = image;
                              });
                            },
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          _buildImagePicker(
                            'Upload ID Image',
                            registerdata.idImage,
                            (File image) {
                              setState(() {
                                registerdata.idImage = image;
                              });
                            },
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          CustomButton(
                            backgroundColor: kYellowColor,
                            label: 'Register',
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                if (registerdata.birthYear != null &&
                                    registerdata.birthMonth != null &&
                                    registerdata.birthDay != null) {
                                  int year = int.parse(registerdata.birthYear!);
                                  int month =
                                      int.parse(registerdata.birthMonth!);
                                  int day = int.parse(registerdata.birthDay!);
                                  DateTime date = DateTime(year, month, day);
                                  registerdata.dateOfBirth =
                                      date.toIso8601String();
                                }
                                if (registerdata.profileImage != null &&
                                    registerdata.idImage != null) {
                                  BlocProvider.of<RegisterCubit>(context)
                                      .registerUser(
                                    userName: registerdata.userName!,
                                    password: registerdata.password!,
                                    email: registerdata.email!,
                                    dateOfBirth: registerdata.dateOfBirth!,
                                    gender: dropdownGendervalue,
                                    phoneNumber: registerdata.phoneNumber!,
                                    jobTitle: registerdata.jobTitle!,
                                    address: registerdata.address!,
                                    profileImage: registerdata.profileImage!,
                                    idImage: registerdata.idImage!,
                                  );
                                } else {
                                  showSnackBar(context,
                                      'Please upload both profile and ID images');
                                }
                              }
                            },
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          const Divider(
                            endIndent: 25,
                            indent: 25,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildImagePicker(
      String label, File? imageFile, Function(File) onImagePicked) {
    return Column(
      children: [
        Text(label),
        const SizedBox(height: 10),
        if (imageFile != null)
          Image.file(
            imageFile,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        const SizedBox(height: 10),
        CustomButton(
          label: 'Pick Image',
          onPressed: () => _pickImage(onImagePicked),
          backgroundColor: kYellowColor,
        ),
      ],
    );
  }

  void dropdownCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        dropdownGendervalue = selectedValue;
      });
    }
  }
}
