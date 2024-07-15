import 'package:flutter/cupertino.dart';

class TextModel extends ChangeNotifier {
  String str = '';
  bool isChangeColor = false;

  TextModel(this.str);
}