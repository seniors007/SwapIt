import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';

class CustomProfileImage extends StatelessWidget {
  final String base64Image;
  final String contentType;

  const CustomProfileImage({
    super.key,
    required this.base64Image,
    required this.contentType,
  });

  @override
  Widget build(BuildContext context) {
    Uint8List imageBytes = base64Decode(base64Image);

    return SizedBox(
      width: MediaQuery.of(context).size.width * .45,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.memory(
          imageBytes,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            debugPrint('Error displaying image: $error');
            return const Icon(Icons.error, size: 100);
          },
        ),
      ),
    );
  }
}
