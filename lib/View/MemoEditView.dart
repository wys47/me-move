import 'package:flutter/material.dart';
import 'package:memove_practice/Model/MemosModel.dart';
import 'package:memove_practice/Model/MemoModel.dart';
import 'package:memove_practice/Model/TextModel.dart';

class MemoEditView extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        height: 200,
        width: 200,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('메모 수정'),
            SizedBox(height: 20),
            TextField(
              controller: _controller,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                MemosModel.addMemo(MemoModel(title: (TextModel(content:_controller.text)))
                  );
                Navigator.of(context).pop();
              },
              child: Text('완료'),
            ),
          ],
        ),
      ),
    );
  }
}
