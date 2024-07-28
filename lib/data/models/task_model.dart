import 'package:flutter/material.dart';
import 'package:memove_practice/data/models/text_model.dart';

class MemoModel extends ChangeNotifier {
  TextModel title;
  bool isChecked;

  MemoModel({
    required this.title,
    this.isChecked = false,
  });
}
