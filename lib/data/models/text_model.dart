import 'package:flutter/cupertino.dart';

class TextModel extends ChangeNotifier {
  String content;   // 텍스트 내용
  double size;      // 텍스트의 크기
  bool isChangeColor;  // 색상 변경 기능 적용 여부
  bool isStrikethrough;  // 취소선 적용 여부
  bool isBold;

  // 7.26 한결 - 빈 모델 쓸 수도 있을 것 같아서 일단 임시로 초기값 다 넣어둠
  TextModel({
    this.content = '\'content\' does not exist in TextModel',
    this.size = 20.0,
    this.isChangeColor = false,
    this.isStrikethrough = false,
    this.isBold = false,
  });
}