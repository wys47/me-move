import 'package:flutter/material.dart';
import 'package:memove_practice/data/models/text_model.dart';
import 'package:memove_practice/data/models/task_model.dart';

class TaskListModel extends ChangeNotifier {
  static List<TaskModel> memos = [
    TaskModel(title:TextModel()),
    TaskModel(title:TextModel(content: '메모 2'))
  ];

  static void addMemo(TaskModel memo) {
    memos.add(memo);
  }
  static int cntMemo() {
    return memos.length;
  }
  static TaskModel getMemoModel(int index)
  {
    return memos[index];
  }
}