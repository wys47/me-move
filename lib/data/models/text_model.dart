import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'text_model.g.dart'; // 이 파일은 코드 생성에 의해 생성됩니다.

@HiveType(typeId: 1)
class TextModel extends ChangeNotifier {
  @HiveField(0)
  String content;

  @HiveField(1)
  double size;

  @HiveField(2)
  bool isChangeColor;

  @HiveField(3)
  bool isStrikethrough;

  @HiveField(4)
  bool isBold;

  TextModel({
    this.content = '\'content\' does not exist in TextModel',
    this.size = 20.0,
    this.isChangeColor = false,
    this.isStrikethrough = false,
    this.isBold = false,
  });
}
