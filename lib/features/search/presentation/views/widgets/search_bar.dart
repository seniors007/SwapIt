import 'dart:developer';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:swapit/core/utils/constants.dart';
import 'package:swapit/core/cubits/search_cubit/search_cubit.dart';
import '../../../../../core/user_controller.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  int _dropdownCategoryValue = 0;
  int _dropdownServiceProviderValue = 0;
  List<Map<String, dynamic>> _categories = [
    {'id': 0, 'name': 'Category'}
  ];
  List<Map<String, dynamic>> _serviceProviders = [
    {'id': 0, 'name': 'Provider'}
  ];
  final TextEditingController _serviceNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchCategories();
    fetchServiceProviders();
  }

  Future<void> fetchCategories() async {
    try {
      dio.Response response =
          await dio.Dio().get('http://localhost:5204/api/categories/getall');
      if (response.statusCode == 200) {
        setState(() {
          _categories = [
            {'id': 0, 'name': 'Category'}
          ];
          _categories.addAll(List<Map<String, dynamic>>.from(response.data));
        });
      } else {
        throw Exception('Failed to fetch categories');
      }
    } catch (e) {
      log('Error fetching categories: $e');
    }
  }

  Future<void> fetchServiceProviders() async {
    try {
      dio.Response response = await dio.Dio()
          .get('http://localhost:5204/api/users/ServiceProvidersDropDown');
      if (response.statusCode == 200) {
        setState(() {
          _serviceProviders = [
            {'id': 0, 'name': 'Provider'}
          ];
          _serviceProviders
              .addAll(List<Map<String, dynamic>>.from(response.data));
        });
      } else {
        throw Exception('Failed to fetch service providers');
      }
    } catch (e) {
      log('Error fetching service providers: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 8),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<int>(
                  items: _categories.map<DropdownMenuItem<int>>((category) {
                    return DropdownMenuItem<int>(
                      value: int.parse(category['id'].toString()),
                      child: Text(category['name']),
                    );
                  }).toList(),
                  value: _dropdownCategoryValue,
                  onChanged: (newValue) {
                    setState(() {
                      _dropdownCategoryValue = newValue!;
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
              ),
              const SizedBox(width: 10),
              Expanded(
                child: DropdownButtonFormField<int>(
                  items:
                      _serviceProviders.map<DropdownMenuItem<int>>((provider) {
                    return DropdownMenuItem<int>(
                      value: int.parse(provider['id'].toString()),
                      child: Text(provider['name']),
                    );
                  }).toList(),
                  value: _dropdownServiceProviderValue,
                  onChanged: (newValue) {
                    setState(() {
                      _dropdownServiceProviderValue = newValue!;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'Service Provider',
                    labelStyle: TextStyle(color: kGreenColor),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kGreenColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15.0),
          Row(
            children: [
              Expanded(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 5,
                  color: kWhiteColor,
                  child: TextField(
                    controller: _serviceNameController,
                    onSubmitted: (_) =>
                        _performSearch(context, userController.userId.value),
                    // ignore: prefer_const_constructors
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 5,
                      ),
                      border: InputBorder.none,
                      labelText: 'Search',
                      labelStyle:
                          const TextStyle(color: kYellowColor, fontSize: 20),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  _performSearch(context, userController.userId.value);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  padding: EdgeInsets.zero,
                ),
                child: Image.asset(
                  'assets/search.png',
                  height: 40,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _performSearch(BuildContext context, int userid) {
    final serviceName = _serviceNameController.text.trim();
    context.read<SearchCubit>().searchService(
          serviceName: serviceName.isNotEmpty ? serviceName : '',
          servicePrice: 0,
          serviceProviderId: _dropdownServiceProviderValue,
          categoryId: _dropdownCategoryValue,
          userId: userid,
        );
  }
}
