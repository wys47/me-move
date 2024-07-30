import 'package:flutter/material.dart';
import 'package:memove_practice/data/task_data.dart';
import 'package:memove_practice/modules/task_editor/local_widgets/add_task_dialog.dart';
import 'package:memove_practice/modules/task_editor/task_editor_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final taskData = Provider.of<TaskData>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        leading: ElevatedButton(
          onPressed: () {
            //버튼 눌릴 때
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            shape: CircleBorder(),
            fixedSize: Size.fromRadius(25),
          ),
          child: Text('목록'),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              //버튼 눌릴 때
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              shape: CircleBorder(),
              fixedSize: Size.fromRadius(25),
            ),
            child: Text('기타'),
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
                    itemCount:taskData.taskCount,
                    itemBuilder: (context, index) {
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
                              transitionDuration: Duration(milliseconds: 150),  // 전환 지속 시간 설정
                            ),
                          );
                        },

                        child: Container(
                          height: 80,
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey,
                          ),
                          alignment: Alignment.center,
                          child: Text(taskData.getTask(index: index).title),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AddTaskDialog();
                    },
                  ).then((value) {
                    setState(() {});
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: CircleBorder(),
                  fixedSize: Size.fromRadius(25),
                ),
                child: Text('+'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
