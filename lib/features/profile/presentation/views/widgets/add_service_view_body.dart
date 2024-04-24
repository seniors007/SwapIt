import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:swapit/constants.dart';
import 'package:swapit/core/widgets/custom_text_field.dart';

class AddServiceViewBody extends StatefulWidget {
  const AddServiceViewBody({super.key});

  @override
  State<AddServiceViewBody> createState() => _AddServiceViewBodyState();
}

class _AddServiceViewBodyState extends State<AddServiceViewBody> {
  String _dropdownvalue = 'Decoration';
  Dio dio = Dio();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 180,
                    ),
                    Text(
                      textAlign: TextAlign.left,
                      'Add Service',
                      style: TextStyle(
                          color: kGreenColor,
                          fontSize: 25,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Row(
                  children: [
                    Text(
                      textAlign: TextAlign.left,
                      'Service Category',
                      style: TextStyle(
                          color: kGreenColor,
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                DropdownButton(
                  items: const [
                    DropdownMenuItem(
                        value: 'Decoration', child: Text('Decoration')),
                    DropdownMenuItem(
                        value: 'Elictrical', child: Text('Elictrical')),
                    DropdownMenuItem(
                        value: 'Cleaning', child: Text('Cleaning')),
                  ],
                  value: _dropdownvalue,
                  onChanged: dropdownCallback,
                  iconSize: 50,
                  isExpanded: true,
                  iconDisabledColor: kYellowColor,
                  iconEnabledColor: kGreenColor,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const CustomTextField(label: 'Service Discription'),
                const SizedBox(
                  height: 15.0,
                ),
                const CustomTextField(label: 'Price'),
                const SizedBox(
                  height: 15.0,
                ),
                const CustomTextField(label: 'Postion'),
                const SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  onPressed: () async {
                    // try {
                    //   Response response = await dio.get(
                    //       'http://127.0.0.1:5204/api/users/IsUserNameExists?username=bbbbbbb');
                    //   if (response.statusCode == 200) {
                    //     print(response.data);
                    //   } else {
                    //     print(
                    //         'Request failed with status: ${response.statusCode}');
                    //   }
                    // } catch (e) {
                    //   print('Error: $e');
                    // }
                    Navigator.pop(context);
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: kYellowColor),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Add',
                      style: TextStyle(
                        color: kWhiteColor,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
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
