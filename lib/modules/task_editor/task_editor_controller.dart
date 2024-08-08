import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:memove_practice/data/task_data.dart';

class TaskEditController {
  final BuildContext context;
  final int taskIndex;
  late TextEditingController titleController;
  late TextEditingController detailController;

  TaskEditController({required this.context, required this.taskIndex}) {
    final taskData = Provider.of<TaskData>(context, listen: false);
    var task = taskData.getTask(index: taskIndex);
    titleController = TextEditingController(text: task.title.content);
    detailController = TextEditingController(text: task.detail);
  }

  void saveTask() {
    final taskData = Provider.of<TaskData>(context, listen: false);
    taskData.changeTitle(index: taskIndex, newTitle: titleController.text);
    taskData.changeDetail(index: taskIndex, newDetail: detailController.text);
  }

  void removeTask() {
    final taskData = Provider.of<TaskData>(context, listen: false);
    taskData.removeTask(index: taskIndex);
  }

  void dispose() {
    titleController.dispose();
    detailController.dispose();
  }
}
