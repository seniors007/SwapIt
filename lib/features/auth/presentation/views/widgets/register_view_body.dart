import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:swapit/core/utils/constants.dart';
import 'package:swapit/core/widgets/custom_button.dart';
import 'package:swapit/core/widgets/custom_snack_bar.dart';
import 'package:swapit/core/widgets/custom_text_field.dart';
import 'package:swapit/features/auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:swapit/features/auth/presentation/views/login_view.dart';
import 'package:swapit/features/auth/presentation/views/widgets/diff_login_method.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  String dropdownGendervalue = 'Male';

  GlobalKey<FormState> formKey = GlobalKey();

  String? userName,
      password,
      email,
      phoneNumber,
      birthYear,
      birthMonth,
      dateOfBirth,
      birthDay;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          isLoading = true;
        } else if (state is RegisterSuccess) {
          Get.to(() => const LoginView());
          showSnackBar(context, 'Register Successful');
          isLoading = false;
        } else if (state is RegisterFailure) {
          showSnackBar(context, state.errMsg);
          isLoading = false;
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
                              userName = data;
                            },
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          CustomTextField(
                            label: 'Email',
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (value) {
                              email = value;
                            },
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          CustomTextField(
                            label: 'Password',
                            onChanged: (data) {
                              password = data;
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
                                  birthYear = value;
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
                                  birthMonth = value;
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
                                  birthDay = value;
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
                              phoneNumber = value;
                            },
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          CustomButton(
                            backgroundColor: kYellowColor,
                            label: 'Register',
                            onPressed: () {
                              //when the app completed shold be activate
                              if (formKey.currentState!.validate()) {
                                if (birthYear != null &&
                                    birthMonth != null &&
                                    birthDay != null) {
                                  int year = int.parse(birthYear!);
                                  int month = int.parse(birthMonth!);
                                  int day = int.parse(birthDay!);
                                  DateTime date = DateTime(year, month, day);
                                  dateOfBirth = date.toIso8601String();
                                }
                                BlocProvider.of<RegisterCubit>(context)
                                    .registerUser(
                                  userName: userName!,
                                  password: password!,
                                  email: email!,
                                  dateOfBirth: dateOfBirth!,
                                  gender: dropdownGendervalue,
                                  phoneNumber: phoneNumber!,
                                );
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
                          const Text(
                            'Or Register with',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          const DiffLoginMethod(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
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
