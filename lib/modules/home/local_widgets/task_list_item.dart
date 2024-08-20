import 'package:flutter/material.dart';
import 'package:memove_practice/data/task_data.dart';
import 'package:memove_practice/modules/task_editor/task_editor_page.dart';
import 'package:memove_practice/theme/theme.dart';
import 'package:provider/provider.dart';

class TaskListItem extends StatefulWidget {
  final int index;
  final Color textColor;

  TaskListItem({required this.index, required this.textColor});

  @override
  _TaskListItemState createState() => _TaskListItemState();
}

class _TaskListItemState extends State<TaskListItem> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    final taskData = Provider.of<TaskData>(context);

    return AnimatedOpacity(
      opacity: _isChecked ? 0.0 : 1.0,
      duration: Duration(milliseconds: 500),
      onEnd: () {
        if (_isChecked) {
          // 애니메이션이 끝나면 상태를 변경
          taskData.changeCheckState(index: widget.index);
        } else{
          print('TaskListItem AnimatedOpacity에서 예상 못한 오류 발생');
        }
      },
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => TaskEditPage(taskIndex: widget.index),
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
        child: Ink(
          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          decoration: BoxDecoration(
            color: getLighterColor(mainColor, 0.999),
          ),
          child: Row(
            children: [
              AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  return ScaleTransition(scale: animation, child: child);
                },
                child: IconButton(
                  key: ValueKey<bool>(_isChecked),
                  onPressed: () {
                    setState(() {
                      _isChecked = !_isChecked;
                    });
                  },
                  icon: Icon(
                    taskData.taskList[widget.index].isChecked
                        ? _isChecked ? Icons.circle_outlined : Icons.check
                        : _isChecked ? Icons.check : Icons.circle_outlined,

                    key: ValueKey<bool>(_isChecked),
                  ),
                ),
              ),

              SizedBox(width: 10.0), // 체크박스와 텍스트 사이 거리
              Text(
                taskData.taskList[widget.index].title.content,
                style: TextStyle(
                  fontSize: taskData.taskList[widget.index].title.size,
                  color: taskData.taskList[widget.index].title.isChangeColor ? widget.textColor : Colors.black,
                  decoration: taskData.taskList[widget.index].isChecked ? TextDecoration.lineThrough : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}