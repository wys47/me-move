import 'package:flutter/material.dart';
import 'package:memove_practice/modules/highlight_settings/highlight_settings_page.dart';

class ChangeEffectButton extends StatelessWidget {
  final int taskIndex;

  ChangeEffectButton({required this.taskIndex});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // 강조 효과를 수정할 수 있는 화면으로 이동하는 로직 추가
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => HighlightSettingsPage(taskIndex: taskIndex),
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
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // 테두리를 둥글게 설정
        ),
      ),
      child: Text('Change Effect'),
    );
  }
}
