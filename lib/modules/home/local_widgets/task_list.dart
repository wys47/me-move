import 'package:flutter/material.dart';
import 'package:memove_practice/data/task_data.dart';
import 'package:memove_practice/modules/home/local_widgets/task_list_item.dart';
import 'package:memove_practice/modules/task_editor/task_editor_page.dart';
import 'package:provider/provider.dart';
import 'package:memove_practice/theme/theme.dart';

class TaskList extends StatelessWidget {
  final List<Color> textColors;
  final int currentColorIndex;

  TaskList({required this.textColors, required this.currentColorIndex});

  @override
  Widget build(BuildContext context) {
    final taskData = Provider.of<TaskData>(context);

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: taskData.taskCount,
      itemBuilder: (context, index) {
        if (!taskData.taskList[index].isChecked) {
          return TaskListItem(
            index: index,
            textColor: textColors[currentColorIndex],
          );
        }
        else{
          return
            Container();
        }
      },
    );
  }
}