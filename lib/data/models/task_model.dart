import 'package:flutter/material.dart';
import 'package:memove_practice/data/models/text_model.dart';

class TaskModel extends ChangeNotifier {
  TextModel title;
  bool isChecked;

  TaskModel({
    required this.title,
    this.isChecked = false,
  });
}
