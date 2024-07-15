import 'package:flutter/cupertino.dart';
import 'package:memove_practice/Model/TextModel.dart';

class MemoModel extends ChangeNotifier {
  TextModel text;

  MemoModel(this.text);
}