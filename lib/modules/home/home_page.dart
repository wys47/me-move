import 'package:flutter/material.dart';
import 'package:memove_practice/data/task_data.dart';
import 'package:memove_practice/modules/home/local_widgets/AddTaskButton.dart';
import 'package:memove_practice/modules/home/local_widgets/completed_task_list.dart';
import 'package:memove_practice/modules/home/local_widgets/task_list.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final List<Color> _textColors = [
    Colors.red,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.purple,
    Colors.indigo,
  ];
  int _currentColorIndex = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
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
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                TaskList(textColors: _textColors, currentColorIndex: _currentColorIndex),
                CompletedTaskList(),
              ],
            ),
          ),
          AddTaskButton(),
        ],
      ),
    );
  }
}
