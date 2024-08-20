import 'package:flutter/material.dart';
import 'package:memove_practice/data/task_data.dart';
import 'package:memove_practice/modules/home/local_widgets/task_list_item.dart';
import 'package:memove_practice/modules/task_editor/task_editor_page.dart';
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
        Container(
          decoration: BoxDecoration(
            color: getLighterColor(mainColor, 0.95),
          ),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 70,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    '완료',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                width: 70,
                child: Row(
                  children: [
                    Text(
                      taskData.cntCheckedTask().toString(),
                      style: TextStyle(fontSize: 20),
                    ),
                    IconButton(
                      onPressed: () {
                        taskData.changedTaskOpen();
                      },
                      icon: Icon(taskData.checkedTaskOpen ? Icons.arrow_drop_down : Icons.arrow_left),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        taskData.checkedTaskOpen
            ? ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: taskData.taskCount,
          itemBuilder: (context, index) {
            if (taskData.taskList[index].isChecked) {
              return TaskListItem(index: index, textColor: textColors[currentColorIndex]);
            } else {
              return Container();
            }
          },
        )
            : Container(),
      ],
    );
  }
}
