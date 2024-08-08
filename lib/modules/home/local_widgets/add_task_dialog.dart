import 'package:flutter/material.dart';
import 'package:memove_practice/data/models/task_model.dart';
import 'package:memove_practice/data/models/text_model.dart';
import 'package:memove_practice/data/task_data.dart';
import 'package:provider/provider.dart';

class AddTaskDialog extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  AddTaskDialog({super.key});
  @override
  Widget build(BuildContext context) {
    final taskData = Provider.of<TaskData>(context);

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        height: 250,
        width: 200,
        padding: EdgeInsets.fromLTRB(20,40,20,10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('메모 추가'),
            SizedBox(height: 10),
            TextField(
              controller: _controller,
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                taskData.addTask(task: TaskModel(title: TextModel(content: _controller.text)));
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
