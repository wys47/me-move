import 'package:flutter/material.dart';
import 'package:memove_practice/modules/home/local_widgets/add_task_dialog.dart';

class AddTaskButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
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
    );
  }
}