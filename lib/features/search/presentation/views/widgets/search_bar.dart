import 'package:flutter/material.dart';
import 'package:swapit/core/utils/constants.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

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
          onSubmitted: (value) {},
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
            hintText: 'What do you look for today?',
          ),
        ),
      ),
    );
  }
}
