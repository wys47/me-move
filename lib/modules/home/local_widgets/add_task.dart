import 'package:flutter/material.dart';
import 'package:memove_practice/data/models/task_model.dart';
import 'package:memove_practice/data/models/text_model.dart';
import 'package:memove_practice/data/task_data.dart';
import 'package:provider/provider.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final TextEditingController _controller = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_checkInput);
  }

  void _checkInput() {
    setState(() {
      _isButtonEnabled = _controller.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final taskData = Provider.of<TaskData>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              autofocus: true,
              controller: _controller,
              decoration: const InputDecoration(
                hintText: "새 할 일",
                filled: false,
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            onPressed: _isButtonEnabled
                ? () {
              taskData.addTask(
                task: TaskModel(
                  title: TextModel(content: _controller.text),
                ),
              );
              Navigator.of(context).pop();
            }
                : null,
            icon: const Icon(Icons.arrow_forward),
            color: _isButtonEnabled
                ? Theme.of(context).primaryColor
                : Colors.grey,
          ),
        ],
      ),
    );
  }
}
