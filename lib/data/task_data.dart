import 'package:flutter/material.dart';
import 'package:memove_practice/data/models/task_model.dart';
import 'package:memove_practice/data/models/text_model.dart';

class TaskData extends ChangeNotifier {
  List<TaskModel> taskList = [
    TaskModel(title: TextModel(content: 'Test 1')),
    TaskModel(title: TextModel(content: 'Test 2'))
  ];

  int get taskCount => taskList.length;
  TaskModel getTask({required int index}) {
    return taskList[index];
  }

  void addTask({required TaskModel task}) {
    taskList.add(task);
    notifyListeners(); //<- 나중에 필요 없을시 제거
  }
  void removeTask({required int index}){
    taskList.removeAt(index);
    notifyListeners(); //<- 나중에 필요 없을시 제거
  }
  void changeTask({required int index, required TaskModel newTask}){
    taskList[index] = newTask;
    notifyListeners(); //<- 나중에 필요 없을시 제거
  }

  void changeCheckState({required int index}){
    taskList.elementAt(index).isChecked
        ? taskList.elementAt(index).isChecked = false
        : taskList.elementAt(index).isChecked = true;
    notifyListeners(); //<- 나중에 필요 없을시 제거
  }

  void changeTextModel({required int index, required TextModel textModel})
  {
    taskList[index].title = textModel;
  }
}
