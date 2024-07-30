import 'package:flutter/material.dart';
import 'package:memove_practice/data/models/task_model.dart';
import 'package:provider/provider.dart';
import 'package:memove_practice/data/task_data.dart';

class TaskEditPage extends StatefulWidget {
  final int taskIndex;

  TaskEditPage({required this.taskIndex});

  @override
  _TaskEditPageState createState() => _TaskEditPageState();
}

class _TaskEditPageState extends State<TaskEditPage> {
  late TextEditingController _titleController;
  late TextEditingController _detailController;

  @override
  void initState() {
    super.initState();
    final taskData = Provider.of<TaskData>(context, listen: false);
    TaskModel task = taskData.getTask(index: widget.taskIndex);
    _titleController = TextEditingController(text: task.title);
    _detailController = TextEditingController(text: task.detail);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _detailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Task'),
        actions: <Widget>[
          PopupMenuButton<int>(
            onSelected: (item) => onSelected(context, item),
            itemBuilder: (context) => [
              PopupMenuItem<int>(
                value: 0,
                child: Text('Save'),
              ),
              PopupMenuItem<int>(
                value: 1,
                child: Text('Cancel'),
              ),
            ],
            icon: Icon(Icons.more_vert),  // 더보기 아이콘
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _detailController,
              decoration: InputDecoration(
                labelText: 'Details',
                border: OutlineInputBorder(),
              ),
              maxLines: null,
              keyboardType: TextInputType.multiline,
            ),
          ],
        ),
      ),
    );
  }

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0: // 'Save' 선택시
        final taskData = Provider.of<TaskData>(context, listen: false);
        taskData.changeTask(
          index: widget.taskIndex,
          newTask: TaskModel(
            title: _titleController.text,
            detail: _detailController.text,
            isChecked: taskData.getTask(index: widget.taskIndex).isChecked,
          ),
        );
        Navigator.pop(context);
        break;
      case 1: // 'Cancel' 선택시
        Navigator.pop(context);
        break;
    }
  }
}
