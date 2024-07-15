import 'package:flutter/cupertino.dart';
import 'package:memove_practice/Model/MemoModel.dart';
import 'package:memove_practice/Model/TextModel.dart';

class MemosModel extends ChangeNotifier {
  static List<MemoModel> memos = [
    MemoModel(TextModel('메모1')),
    MemoModel(TextModel('메모2'))
  ];

  static void addMemo(MemoModel memo) {
    memos.add(memo);
  }
  static int cntMemo() {
    return memos.length;
  }
  static MemoModel getMemo(int index)
  {
    return memos[index];
  }
}