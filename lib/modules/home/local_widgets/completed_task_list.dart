import 'package:flutter/material.dart';
import 'package:memove_practice/data/task_data.dart';
import 'package:memove_practice/modules/task_editor/task_editor_page.dart';
import 'package:memove_practice/theme/theme.dart';
import 'package:provider/provider.dart';

class CompletedTaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final taskData = Provider.of<TaskData>(context);

    return Column(
      children: [
        Container(
          height: 60,
          margin: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: getLighterColor(mainColor, 0.85),
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
          },
        )
            : Container(),
      ],
    );
  }
}
