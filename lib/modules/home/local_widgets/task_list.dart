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

class TaskListItem extends StatefulWidget {
  final int index;
  final Color textColor;

  TaskListItem({required this.index, required this.textColor});

  @override
  _TaskListItemState createState() => _TaskListItemState();
}

class _TaskListItemState extends State<TaskListItem> {
  //애니메이션 관련 변수
  bool _isChecked = false;
  double _opacity = 1.0;

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
          taskData.changeIsStrikeThrough(index: widget.index);
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
                      _opacity = _isChecked ? 0.0 : 1.0;

                      // 애니메이션 후 상태 변경
                      if (_isChecked) {
                        Future.delayed(Duration(milliseconds: 300), () {
                          setState(() {
                            _opacity = 0.0;
                          });
                        });
                      }
                    });
                  },
                  icon: Icon(
                    _isChecked ? Icons.check : Icons.circle_outlined,
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
