import 'package:flutter/material.dart';
import 'package:memove_practice/data/task_data.dart';
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
        return TaskListItem(
          index: index,
          textColor: textColors[currentColorIndex],
        );
      },
    );
  }
}

class TaskListItem extends StatelessWidget {
  final int index;
  final Color textColor;

  TaskListItem({required this.index, required this.textColor});

  @override
  Widget build(BuildContext context) {
    final taskData = Provider.of<TaskData>(context);

    if (!taskData.taskList[index].isChecked) {
      return InkWell(
        onTap: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => TaskEditPage(taskIndex: index),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
              transitionDuration: Duration(milliseconds: 150),
            ),
          );
        },
        child: Stack(
          children: [
            Container(
              height: 80,
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: getLighterColor(mainColor, 0.85),
              ),
              alignment: Alignment.center,
              child: Text(
                taskData.taskList[index].title.content,
                style: TextStyle(
                  fontSize: taskData.taskList[index].title.size,
                  color: taskData.taskList[index].title.isChangeColor ? textColor : Colors.black,
                  decoration: taskData.taskList[index].isChecked ? TextDecoration.lineThrough : null,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                height: 80,
                width: 80,
                child: IconButton(
                  onPressed: () {
                    taskData.changeCheckState(index: index);
                    taskData.changeIsStrikeThrough(index: index);
                  },
                  icon: Icon(taskData.taskList[index].isChecked ? Icons.check : Icons.square_outlined),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}
