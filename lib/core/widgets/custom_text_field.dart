import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swapit/core/utils/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.label,
    this.onChanged,
    this.keyboardType,
    this.hintText,
    this.inputFormatters,
    this.width,
  });
  final TextInputType? keyboardType;
  final String label;
  final Function(String)? onChanged;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 350,
      child: TextFormField(
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
      ),
    );
  }
}
