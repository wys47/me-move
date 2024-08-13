import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:memove_practice/data/models/task_model.dart';


class TaskData extends ChangeNotifier {
  //지금은 taskList와 taskBox에 같은 데이터를 동시에 저장하는 구조
  // 왜 굳이 저장하는 걸 분리했나?
  // 1. View의 모든 위젯이 지금 taskList를 참조하는 구조라서 hive라이브러리의 box로 바꿀려면 바꿀게 많음
  // 2. 더 좋은 구조의 가능성이 있어서 임시로 이렇게 만들어 둠
  // -> 구조적으로 분리하는 케이스(속도 측면에서 이점을 챙기려고 TaskList를 캐시로 사용하고 taskBox를 저장소로 사용)가 있음
  // 위 같은 이유로 일단 임시로 분리해둠.

  List<TaskModel> taskList = [];
  late Box<TaskModel> taskBox;

  TaskData() {
    _loadTasks();
  }

  void _loadTasks() async {
    taskBox = await Hive.openBox<TaskModel>('taskBox');
    taskList = taskBox.values.toList();
    notifyListeners();
  }

  int get taskCount => taskBox.length;

  TaskModel getTask({required int index}) {
    return taskBox.getAt(index)!;
  }

  void addTask({required TaskModel task}) {
    taskList.add(task);
    taskBox.add(task);  // Hive에 데이터 저장
    notifyListeners();
  }

  void removeTask({required int index}){
    taskList.removeAt(index);
    taskBox.deleteAt(index);  // Hive에서 데이터 삭제
    notifyListeners();
  }

  void changeCheckState({required int index}){
    var task = taskList.elementAt(index);
    task.isChecked = !task.isChecked;
    taskBox.putAt(index, task);  // Hive에 수정된 데이터 저장
    notifyListeners();
  }

  void changeIsStrikeThrough({required int index}){
    taskList[index].title.isStrikethrough = !taskList[index].title.isStrikethrough;
    taskBox.putAt(index, taskList[index]);  // Hive에 수정된 데이터 저장
    notifyListeners();
  }

  void changeIsChangeColor({required int index}){
    taskList[index].title.isChangeColor = !taskList[index].title.isChangeColor;
    taskBox.putAt(index, taskList[index]);  // Hive에 수정된 데이터 저장
    notifyListeners();
  }

  void changeTitle({required int index, required String newTitle}){
    taskList[index].title.content = newTitle;
    taskBox.putAt(index, taskList[index]);  // Hive에 수정된 데이터 저장
    notifyListeners();
  }

  void changeDetail({required int index, required String newDetail}){
    taskList[index].detail = newDetail;
    taskBox.putAt(index, taskList[index]);  // Hive에 수정된 데이터 저장
    notifyListeners();
  }

  int cntCheckedTask() {
    int cnt = 0;
    for (int i = 0; i < taskList.length; ++i) {
      if (taskList[i].isChecked) ++cnt;
    }
    return cnt;
  }

  //얘를 completed_task_list (홈 화면에 있음)으로 옮기는 거 고려해보기
  bool checkedTaskOpen = false;
  void changedTaskOpen() {
    checkedTaskOpen = !checkedTaskOpen;
    notifyListeners();
  }

}
