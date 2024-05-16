import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:swapit/core/utils/constants.dart';
import 'package:swapit/core/widgets/custom_text_field.dart';

class AddServiceViewBody extends StatefulWidget {
  const AddServiceViewBody({super.key});

  @override
  State<AddServiceViewBody> createState() => _AddServiceViewBodyState();
}

class _AddServiceViewBodyState extends State<AddServiceViewBody> {
  String _dropdownValue = '';
  List<Map<String, dynamic>> _categories = []; // Store categories here

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
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
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
                    items:
                        _categories.map<DropdownMenuItem<String>>((category) {
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
                  ElevatedButton(
                    onPressed: () {
                      log(_dropdownValue);
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
      ),
    );
  }
}
