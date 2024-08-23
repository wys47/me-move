import 'package:flutter/material.dart';
import 'package:memove_practice/modules/highlight_settings/highlight_settings_page.dart';
import 'package:memove_practice/theme/theme.dart';

class ChangeEffectButton extends StatelessWidget {
  final int taskIndex;

  ChangeEffectButton({required this.taskIndex});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
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
      style: OutlinedButton.styleFrom(
        shape: CircleBorder(), // 원형 버튼으로 설정
        side: BorderSide( // 윤곽선 색상 설정
          width: 2.0, // 윤곽선 두께 설정
          color: mainColor,
        ),

        padding: EdgeInsets.all(12), // 아이콘 주변의 패딩 설정
      ),
      child: Icon(Icons.edit, color:mainColor), // 원하는 아이콘 선택
    );
  }
}
