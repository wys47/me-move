import 'package:flutter/material.dart';
import 'package:memove_practice/data/models/task_model.dart';
import 'package:memove_practice/data/models/text_model.dart';
import 'package:memove_practice/data/task_data.dart';
import 'package:provider/provider.dart';

class AddTaskDialog extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final taskData = Provider.of<TaskData>(context);

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        height: 200,
        width: 200,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('메모 수정'),
            SizedBox(height: 20),
            TextField(
              controller: _controller,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                taskData.addTask(task: TaskModel(title: _controller.text));
                Navigator.of(context).pop();
              },
              child: Text('완료'),
            ),
          ],
        ),
      ),
    );
  }
}
