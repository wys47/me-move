import 'package:flutter/material.dart';
import 'package:memove_practice/data/models/task_model.dart';
import 'package:memove_practice/modules/highlight_settings/highlight_settings_page.dart';
import 'package:provider/provider.dart';
import 'package:memove_practice/data/task_data.dart';

class TaskEditPage extends StatefulWidget {
  final int taskIndex;

  TaskEditPage({super.key, required this.taskIndex});

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
    _titleController = TextEditingController(text: task.title.content);
    _detailController = TextEditingController(text: task.detail);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _detailController.dispose();
    super.dispose();
  }

  void saveTask() {
    final taskData = Provider.of<TaskData>(context, listen: false);
    taskData.changeTitle(index: widget.taskIndex, newTitle: _titleController.text);
    taskData.changeDetail(index: widget.taskIndex, newDetail: _detailController.text);
  }

  void removeTask() {
    final taskData = Provider.of<TaskData>(context, listen: false);
    taskData.removeTask(index: widget.taskIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            saveTask(); // 뒤로가기 버튼을 눌렀을 때 저장
            Navigator.pop(context);
          },
        ),
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
              PopupMenuItem<int>(
                value: 2,
                child: Text('Remove'),  // 추가: 작업 제거 메뉴 아이템
              ),
            ],
            icon: Icon(Icons.more_vert), // 더보기 아이콘
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
            ), // 타이틀
            SizedBox(height: 20),
            TextField(
              controller: _detailController,
              decoration: InputDecoration(
                labelText: 'Details',
                border: OutlineInputBorder(),
              ),
              maxLines: null,
              keyboardType: TextInputType.multiline,
            ), // 디테일
            ElevatedButton(
              onPressed: () {
                // 강조 효과를 수정할 수 있는 화면으로 이동하는 로직 추가
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => HighlightSettingsPage(taskIndex: widget.taskIndex),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                    transitionDuration: Duration(milliseconds: 150),  // 전환 지속 시간 설정
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // 테두리를 둥글게 설정
                ),
              ),
              child: Text('Change Effect'),
            ),
          ],
        ),
      ),
    );
  }

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0: // 'Save' 선택시
        saveTask();
        Navigator.pop(context);
        break;
      case 1: // 'Cancel' 선택시
        Navigator.pop(context);
        break;
      case 2: // 'Remove' 선택시
        removeTask();
        Navigator.pop(context);  // 작업을 제거한 후 화면을 닫습니다.
        break;
    }
  }
}
