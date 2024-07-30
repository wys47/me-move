import 'package:flutter/material.dart';
import 'package:memove_practice/data/models/text_model.dart';

class TaskModel extends ChangeNotifier {
  String title;
  String detail;
  bool isChecked;

  TaskModel({
    required this.title,
    this.detail='No detail in TaskModel.dart',
    this.isChecked = false,
  });
}
