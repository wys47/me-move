import 'package:hive/hive.dart';
import 'package:memove_practice/data/models/text_model.dart';

part 'task_model.g.dart'; // 이 파일은 코드 생성에 의해 생성됩니다.

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  TextModel title;

  @HiveField(1)
  String detail;

  @HiveField(2)
  bool isChecked;

  TaskModel({
    required this.title,
    this.detail = '',
    this.isChecked = false,
  });
}
