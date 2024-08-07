import 'package:flutter/material.dart';
import 'package:memove_practice/modules/task_editor/task_editor_controller.dart';

class TaskEditAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TaskEditController controller;

  TaskEditAppBar({required this.controller});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          controller.saveTask(); // 뒤로가기 버튼을 눌렀을 때 저장
          Navigator.pop(context);
        },
      ),
      title: Text('Edit Task'),
      actions: <Widget>[
        PopupMenuButton<int>(
          onSelected: (item) => onSelected(context, item),
          itemBuilder: (context) => [
            PopupMenuItem<int>(
              value: 0,
              child: Text('Save'),
            ),
            PopupMenuItem<int>(
              value: 1,
              child: Text('Cancel'),
            ),
            PopupMenuItem<int>(
              value: 2,
              child: Text('Remove'), // 추가: 작업 제거 메뉴 아이템
            ),
          ],
          icon: Icon(Icons.more_vert), // 더보기 아이콘
        ),
      ],
    );
  }

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0: // 'Save' 선택시
        controller.saveTask();
        Navigator.pop(context);
        break;
      case 1: // 'Cancel' 선택시
        Navigator.pop(context);
        break;
      case 2: // 'Remove' 선택시
        controller.removeTask();
        Navigator.pop(context); // 작업을 제거한 후 화면을 닫습니다.
        break;
    }
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
