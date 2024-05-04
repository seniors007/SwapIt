import 'package:flutter/material.dart';

class ServiceNotes extends StatelessWidget {
  const ServiceNotes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Image(
          image: AssetImage('assets/notes.png'),
          height: 25,
        ),
        SizedBox(
          width: 15,
        ),
        SizedBox(
          width: 210,
          height: 80,
          child: Text(
            "there is my note there is my note there is my note there is my note there is my note there is my note there is my note there is my note there is my note ",
            overflow: TextOverflow.visible,
          ),
        )
      ],
    );
  }
}
