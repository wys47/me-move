import 'package:flutter/material.dart';
import 'package:memove_practice/data/models/task_model.dart';
import 'package:memove_practice/data/models/text_model.dart';
import 'package:memove_practice/data/task_data.dart';
import 'package:memove_practice/data/UISetting_data.dart';
import 'package:provider/provider.dart';

class AddTaskDialog extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  AddTaskDialog({super.key});
  @override
  Widget build(BuildContext context) {
    final taskData = Provider.of<TaskData>(context);
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        height: mediaQueryData.size.height * UiSettingData.addTaskDialogYCoefficient,
        width: mediaQueryData.size.width * UiSettingData.addTaskDialogXCoefficient,
        padding: EdgeInsets.fromLTRB(20,40,20,10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '메모 추가',
              style: TextStyle(
                fontSize: UiSettingData.fontSizeByScreenSize(
                  UiSettingData.fontSizeSmall, mediaQueryData.size.width * UiSettingData.addTaskDialogXCoefficient
                )
              ),
            ),
            SizedBox(
                height: mediaQueryData.size.height * UiSettingData.addTaskDialogYCoefficient * UiSettingData.addTaskDialogSpaceCoefficient
            ),
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
