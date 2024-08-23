import 'package:flutter/material.dart';

class DetailField extends StatelessWidget {
  final TextEditingController detailController;

  DetailField({required this.detailController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: detailController,
      decoration: InputDecoration(
        hintText: '메모 추가',
        border: InputBorder.none,
      ),
      maxLines: null,
      keyboardType: TextInputType.multiline,
    );
  }
}
