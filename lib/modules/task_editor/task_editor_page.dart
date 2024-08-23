import 'package:flutter/material.dart';
import 'package:memove_practice/modules/task_editor/local_widgets/change_effect_button.dart';
import 'package:memove_practice/modules/task_editor/local_widgets/detail_field.dart';
import 'package:memove_practice/modules/task_editor/local_widgets/task_editor_appbar.dart';
import 'package:memove_practice/modules/task_editor/local_widgets/title_field.dart';
import 'package:memove_practice/modules/task_editor/task_editor_controller.dart';

class TaskEditPage extends StatefulWidget {
  final int taskIndex;

  TaskEditPage({super.key, required this.taskIndex});

  @override
  _TaskEditPageState createState() => _TaskEditPageState();
}

class _TaskEditPageState extends State<TaskEditPage> {
  late TaskEditController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TaskEditController(context: context, taskIndex: widget.taskIndex);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TaskEditAppBar(controller: _controller),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  child: TitleField(titleController: _controller.titleController),
                ),
                SizedBox(width: 8), // TitleField와 IconButton 간의 간격
                ChangeEffectButton(taskIndex: widget.taskIndex),
              ],
            ),
            DetailField(detailController: _controller.detailController),
          ],
        ),
      ),
    );
  }
}
