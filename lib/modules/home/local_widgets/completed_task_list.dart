import 'package:flutter/material.dart';
import 'package:memove_practice/data/task_data.dart';
import 'package:memove_practice/modules/home/local_widgets/task_list_item.dart';
import 'package:memove_practice/theme/theme.dart';
import 'package:provider/provider.dart';

class CompletedTaskList extends StatelessWidget {
  final List<Color> textColors;
  final int currentColorIndex;

  CompletedTaskList({required this.textColors, required this.currentColorIndex});

  @override
  Widget build(BuildContext context) {
    final taskData = Provider.of<TaskData>(context);

    return Column(
      children: [
        InkWell(
          onTap: () {
            taskData.changedTaskOpen();
          },
          splashColor: Colors.grey.withOpacity(0.2),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
            decoration: BoxDecoration(
              color: getLighterColor(mainColor, 0.95),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '완료',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Row(
                  children: [
                    Text(
                      taskData.cntCheckedTask().toString(),
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Icon(taskData.checkedTaskOpen ? Icons.arrow_drop_down : Icons.arrow_left),
                  ],
                ),
              ],
            ),
          ),
        ),
        if (taskData.checkedTaskOpen)
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: taskData.taskCount,
            itemBuilder: (context, index) {
              if (taskData.taskList[index].isChecked) {
                return TaskListItem(index: index, textColor: textColors[currentColorIndex]);
              } else {
                return SizedBox.shrink(); // 빈 공간을 줄 때 Container 대신 SizedBox.shrink() 사용
              }
            },
          ),
      ],
    );
  }
}
