import 'package:flutter/material.dart';
import 'package:memove_practice/data/UISetting_data.dart';
import 'package:memove_practice/data/task_data.dart';
import 'package:memove_practice/modules/home/local_widgets/task_list_item.dart';
import 'package:provider/provider.dart';

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
          return Dismissible(
            key: Key(taskData.taskList[index].hashCode.toString()), // 각 항목을 고유하게 식별하기 위한 key //key: ValueKey(index), //!!오류 가능성
            direction: DismissDirection.endToStart, // 오른쪽에서 왼쪽으로 스와이프 허용
            background: Container(
              color: Colors.red, // 삭제 시 배경색
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            onDismissed: (direction) {
              // 삭제 로직
              taskData.removeTask(index: index);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Task deleted'),
                ),
              );
            },
            child: TaskListItem(
              index: index,
              textColor: textColors[currentColorIndex],
            ),
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
