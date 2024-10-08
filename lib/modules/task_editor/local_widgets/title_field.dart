import 'package:flutter/material.dart';

class TitleField extends StatelessWidget {
  final TextEditingController titleController;

  TitleField({required this.titleController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: titleController,
      decoration: InputDecoration(
        hintText: '제목 입력',
        border: InputBorder.none, // 테두리 제거
        contentPadding: EdgeInsets.symmetric(vertical: 10.0,), // 패딩 조정
      ),
      style: TextStyle(
        fontSize: 25.0, // 글씨 크기 조정
      ),
    );
  }
}