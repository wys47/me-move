import 'package:flutter/material.dart';
import 'package:memove_practice/data/models/text_model.dart';
import 'package:memove_practice/data/models/task_model.dart';

class MemosModel extends ChangeNotifier {
  static List<MemoModel> memos = [
    MemoModel(title:TextModel()),
    MemoModel(title:TextModel(content: '메모 2'))
  ];

  static void addMemo(MemoModel memo) {
    memos.add(memo);
  }
  static int cntMemo() {
    return memos.length;
  }
  static MemoModel getMemoModel(int index)
  {
    return memos[index];
  }
}