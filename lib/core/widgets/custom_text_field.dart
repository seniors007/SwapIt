import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swapit/core/utils/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.label,
      this.onChanged,
      this.keyboardType,
      this.hintText,
      this.inputFormatters});
  final TextInputType? keyboardType;
  final String label;
  final Function(String)? onChanged;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data) {
        if (data!.isEmpty) {
          return '$label is required';
        }
        return null;
      },
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        labelStyle: const TextStyle(
          color: kGreenColor,
          fontSize: 17,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: kGreenColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: kYellowColor),
        ),
      ),
      keyboardType: keyboardType,
    );
  }
}
