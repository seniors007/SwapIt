import 'package:flutter/material.dart';

class ServiceNotes extends StatelessWidget {
  const ServiceNotes({
    super.key,
    required this.notes,
  });
  final String notes;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Image(
          image: AssetImage('assets/notes.png'),
          height: 25,
        ),
        const SizedBox(
          width: 15,
        ),
        SizedBox(
          width: 170,
          height: 80,
          child: Center(
            child: Text(
              notes,
              overflow: TextOverflow.visible,
            ),
          ),
        )
      ],
    );
  }
}
