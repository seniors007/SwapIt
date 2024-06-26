import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:swapit/core/utils/constants.dart';
import 'package:swapit/core/widgets/custom_snack_bar.dart';
import 'package:swapit/core/widgets/custom_text_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:swapit/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:swapit/features/auth/presentation/views/register_view.dart';
import 'package:swapit/core/widgets/custom_button.dart';
import 'package:swapit/features/home/presentation/views/home_view.dart';
import '../../../../../core/user_controller.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? userName, password;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find();
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSuccess) {
          userController.setUser(
            state.loginResponse.userId,
            state.loginResponse.userName,
            state.loginResponse.roles,
          );

          Get.to(() => const Homeview());
          showSnackBar(context, 'Login Successful');
          isLoading = false;
        } else if (state is LoginFailure) {
          showSnackBar(context, state.errMsg);
          isLoading = false;
        }
      },
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/swapIt.png'),
                const SizedBox(
                  height: 8,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            textAlign: TextAlign.left,
                            'Login',
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
                        label: 'Password',
                        onChanged: (data) {
                          password = data;
                        },
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      CustomButton(
                        label: 'Login',
                        backgroundColor: kYellowColor,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<LoginCubit>(context).loginUser(
                                userName: userName!, password: password!);
                          }
                        },
                      ),
                      const SizedBox(
                        height: 150,
                      ),
                      const Divider(
                        endIndent: 25,
                        indent: 25,
                        color: Colors.grey,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'You don\'t have account click',
                            style: TextStyle(color: kGreenColor, fontSize: 16),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.to(() => const RegisterView());
                            },
                            child: const Text(
                              'Register',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: kYellowColor,
                                  fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
