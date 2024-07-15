import 'package:memove_practice/Model/MemosModel.dart';
import 'package:memove_practice/Model/MemoModel.dart';

class HomePageCtrl
{
  static void addMemo(MemoModel memo)
  {
    MemosModel.addMemo(memo);
  }
}