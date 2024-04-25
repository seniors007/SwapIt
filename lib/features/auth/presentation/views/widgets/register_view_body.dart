import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:swapit/constants.dart';
import 'package:swapit/core/widgets/custom_button.dart';
import 'package:swapit/core/widgets/custom_text_field.dart';
import 'package:swapit/features/auth/presentation/views/login_view.dart';
import 'package:swapit/features/auth/presentation/views/widgets/diff_login_method.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  String _dropdownvalue = 'Male';
  // final _formKey = GlobalKey<FormState>();
  // TextEditingController _emailController = TextEditingController();
  // late String _emailErrorText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
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
                const CustomTextField(label: 'Email'),
                const SizedBox(
                  height: 20.0,
                ),
                const CustomTextField(label: 'Password'),
                const SizedBox(
                  height: 20.0,
                ),
                const CustomTextField(label: 'Birth Date'),
                const SizedBox(
                  height: 20.0,
                ),
                const Row(
                  children: [
                    Text(
                      textAlign: TextAlign.left,
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
                    DropdownMenuItem(value: 'Male', child: Text('Male')),
                    DropdownMenuItem(value: 'Female', child: Text('Female')),
                  ],
                  value: _dropdownvalue,
                  onChanged: dropdownCallback,
                  iconSize: 50,
                  isExpanded: true,
                  iconDisabledColor: kYellowColor,
                  iconEnabledColor: kGreenColor,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const CustomTextField(label: 'Phone Number'),
                const SizedBox(
                  height: 20.0,
                ),
                CustomButton(
                  backgroundColor: kYellowColor,
                  label: 'Register',
                  onPressed: () {
                    Get.to(() => const LoginView());
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
    );
  }

  // void postData() async {
  //   Dio dio = Dio();
  //   String url = 'http://127.0.0.1:5204/api/users/create';

  //   Map<String, dynamic> data = {
  //     "username": "pppppp",
  //     "password": "To@@ma\$1",
  //     "roleid": "admin"
  //   };
  //   try {
  //     Response response = await dio.post(
  //       url,
  //       data: data,
  //       options: Options(
  //         contentType: Headers.jsonContentType,
  //       ),
  //     );

  //     if (response.statusCode == 200) {
  //       debugPrint('request successful');
  //       print(response.data);
  //     } else {
  //       // Request failed with non-200 status code
  //       print('Request failed with status: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     // Error occurred during request
  //     print('Error: $e');
  //   }
  // }

  void dropdownCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _dropdownvalue = selectedValue;
      });
    }
  }
}
