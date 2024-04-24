import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swapit/constants.dart';
import 'package:swapit/core/widgets/text_field.dart';
import 'package:swapit/features/auth/presentation/views/register_view.dart';
import 'package:swapit/features/auth/presentation/views/widgets/diff_login_method.dart';
import 'package:swapit/features/auth/presentation/views/widgets/login_button.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final _formKey = GlobalKey<FormState>();
  // final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              key: _formKey,
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
                  const CustomTextField(label: 'Email'),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const CustomTextField(label: 'Password'),
                  const SizedBox(
                    height: 30.0,
                  ),
                  const LoginButton(),
                  const SizedBox(
                    height: 30,
                  ),
                  const Divider(
                    endIndent: 25,
                    indent: 25,
                    color: Colors.grey,
                  ),
                  const Text(
                    'Or Login with',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  const DiffLoginMethod(),
                  const SizedBox(
                    height: 50,
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
    );
  }
}
