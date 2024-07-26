import 'package:flutter/cupertino.dart';
import 'package:memove_practice/Model/TextModel.dart';

class MemoModel extends ChangeNotifier {
  TextModel title;
  bool isChecked;

  MemoModel({
    required this.title,
    this.isChecked = false,
  });
}
