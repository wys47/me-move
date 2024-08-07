import 'package:flutter/material.dart';

class DetailField extends StatelessWidget {
  final TextEditingController detailController;

  DetailField({required this.detailController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: detailController,
      decoration: InputDecoration(
        labelText: 'Details',
        border: OutlineInputBorder(),
      ),
      maxLines: null,
      keyboardType: TextInputType.multiline,
    );
  }
}
