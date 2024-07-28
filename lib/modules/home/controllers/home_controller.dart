import 'package:memove_practice/data/models/task_list_model.dart';
import 'package:memove_practice/data/models/task_model.dart';

class HomePageCtrl {
  static void addMemo(MemoModel memo)
  {
    MemosModel.addMemo(memo);
  }
}