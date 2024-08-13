import 'package:flutter/material.dart';
import 'package:memove_practice/data/task_data.dart';
import 'package:memove_practice/data/UISetting_data.dart';
import 'package:provider/provider.dart';

class HighlightSettingsPage extends StatefulWidget {
  final int taskIndex;
  HighlightSettingsPage({super.key, required this.taskIndex});

  @override
  State<HighlightSettingsPage> createState() => _HighlightSettingsPageState();
}

class _HighlightSettingsPageState extends State<HighlightSettingsPage> {
  @override
  Widget build(BuildContext context) {
    final taskData = Provider.of<TaskData>(context);
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Highlight Settings',
          style: TextStyle(
            fontSize: UiSettingData.fontSizeByScreenSize(UiSettingData.fontSizeDefault, mediaQueryData.size.width)
          ),
        ),
      ),
      body: Row(
        children: [
          Checkbox(
              value: taskData.taskList[widget.taskIndex].title.isChangeColor,
              onChanged: (bool? value) {
                setState(() {
                  taskData.changeIsChangeColor(index: widget.taskIndex);
                });
              }
          ),
          Text(
            'Emphasize Title',
            style: TextStyle(
              fontSize: UiSettingData.fontSizeByScreenSize(UiSettingData.fontSizeDefault, mediaQueryData.size.width)
            ),
          ),
        ]
      )
    );
  }
}