import 'package:flutter/material.dart';
import 'package:memove_practice/data/task_data.dart';
import 'package:memove_practice/modules/task_editor/local_widgets/add_task_dialog.dart';
import 'package:memove_practice/modules/task_editor/task_editor_page.dart';
import 'package:memove_practice/theme/theme.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  // 색상 리스트 정의
  final List<Color> _textColors = [
    Colors.red,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.purple,
    Colors.indigo,
  ];

  // 현재 색상 인덱스를 추적하는 변수
  int _currentColorIndex = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // 홈 화면에 진입할 때마다 색상 변경
    setState(() {
      _currentColorIndex = (_currentColorIndex + 1) % _textColors.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final taskData = Provider.of<TaskData>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.dehaze),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // '기타' 버튼 눌릴 때 동작
            },
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: taskData.taskCount,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation, secondaryAnimation) =>
                                  TaskEditPage(taskIndex: index),
                              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: child,
                                );
                              },
                              transitionDuration: Duration(milliseconds: 150), // 전환 지속 시간 설정
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
                                  color:  taskData.taskList[index].title.isChangeColor ? _textColors[_currentColorIndex] : Colors.black, // 텍스트 색상 설정
                                  decoration: taskData.taskList[index].isChecked
                                      ? TextDecoration.lineThrough
                                      : null,
                                ),
                              ),
                            ),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  height: 80,
                                  width: 80,
                                  child: IconButton(
                                      onPressed: () {
                                        taskData.changeCheckState(index: index);
                                        taskData.changeIsStrikeThrough(index: index);
                                      },
                                      icon: Icon(taskData.taskList[index].isChecked
                                          ? Icons.check
                                          : Icons.square_outlined)),
                                ))
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                shape: CircleBorder(),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AddTaskDialog();
                    },
                  );
                },
                child: Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
