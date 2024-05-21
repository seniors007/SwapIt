import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swapit/core/utils/constants.dart';
import 'package:swapit/features/profile/presentation/manager/search_cubit/search_cubit.dart';

class CustomSearchBar extends StatelessWidget {
  CustomSearchBar({super.key});
  final TextEditingController _serviceNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 8),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        color: kWhiteColor,
        child: TextField(
          controller: _serviceNameController,
          onSubmitted: (_) => _performSearch(context),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 5,
            ),
            border: InputBorder.none,
            labelText: 'Search',
            labelStyle: const TextStyle(color: kYellowColor, fontSize: 20),
            suffixIcon: Image.asset(
              'assets/search.png',
              height: 30,
            ),
          ),
        ),
      ),
    );
  }

  void _performSearch(BuildContext context) {
    final serviceName = _serviceNameController.text.trim();
    if (serviceName.isNotEmpty) {
      context.read<SearchCubit>().searchService(
            serviceName: serviceName,
            servicePrice: 0,
            serviceProviderId: 0,
            categoryId: 0,
          );
    }
  }
}
