import 'package:flutter/material.dart';
<<<<<<< Updated upstream:lib/View/MemoEditView.dart
import 'package:memove_practice/Model/MemosModel.dart';
import 'package:memove_practice/Model/MemoModel.dart';
import 'package:memove_practice/Model/TextModel.dart';
import 'package:memove_practice/View/HomePageView.dart';
//테스트
class MemoEditView extends StatelessWidget {
=======
import 'package:memove_practice/data/models/task_model.dart';
import 'package:memove_practice/data/models/text_model.dart';
import 'package:memove_practice/data/task_data.dart';
import 'package:provider/provider.dart';

class AddTaskDialog extends StatelessWidget {
>>>>>>> Stashed changes:lib/modules/task_editor/local_widgets/add_task_dialog.dart
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
<<<<<<< Updated upstream:lib/View/MemoEditView.dart
                MemosModel.addMemo(MemoModel(TextModel(_controller.text)));
=======
                taskData.addTask(task: TaskModel(title: TextModel(content: _controller.text)));
>>>>>>> Stashed changes:lib/modules/task_editor/local_widgets/add_task_dialog.dart
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
