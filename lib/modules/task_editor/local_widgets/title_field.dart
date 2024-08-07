import 'package:flutter/material.dart';

class TitleField extends StatelessWidget {
  final TextEditingController titleController;

  TitleField({required this.titleController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: titleController,
      decoration: InputDecoration(
        labelText: 'Title',
        border: OutlineInputBorder(),
      ),
    );
  }
}
