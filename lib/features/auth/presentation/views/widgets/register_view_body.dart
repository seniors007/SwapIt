import 'package:flutter/material.dart';
import 'package:swapit/constants.dart';
import 'package:swapit/core/widgets/text_field.dart';
import 'package:swapit/features/auth/presentation/views/widgets/diff_login_method.dart';
import 'package:swapit/features/auth/presentation/views/widgets/register_button.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  String _dropdownvalue = 'Male';
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
                const RegisterButton(),
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

  void dropdownCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _dropdownvalue = selectedValue;
      });
    }
  }
}
