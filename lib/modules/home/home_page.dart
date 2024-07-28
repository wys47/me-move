import 'package:flutter/material.dart';
import 'package:memove_practice/data/models/task_list_model.dart';
import 'package:memove_practice/modules/task_editor/local_widgets/add_task_dialog.dart';


class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
                    itemCount: TaskListModel.cntMemo(),
                    itemBuilder: (context, i) {
                      return Container(
                        height: 80,
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey,
                        ),
                        alignment: Alignment.center,
                        child: Text(TaskListModel.getMemoModel(i).title.content),
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