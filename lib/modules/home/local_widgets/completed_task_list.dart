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
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

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
                return Dismissible(
                  key: ValueKey(taskData.taskList[index].hashCode), // 객체의 해시코드를 Key로 사용
                  direction: DismissDirection.endToStart, // 오른쪽에서 왼쪽으로 스와이프
                  background: Container(
                    color: Colors.red, // 스와이프 시 나타나는 배경 색상
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  onDismissed: (direction) {
                    // 스와이프 후 해당 항목을 삭제
                    taskData.removeTask(index:index);

                    // 삭제 후 스낵바를 통해 알림 표시
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
                return SizedBox.shrink(); // 빈 공간을 줄 때 Container 대신 SizedBox.shrink() 사용
              }
            },
          ),
      ],
    );
  }
}
