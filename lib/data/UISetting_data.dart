import 'dart:math';

class UiSettingData {
  //텍스트 크기 관련 멤버
  static double fontSizeDefault = 20.0;
  static double fontSizeEmphasized = 24.0;
  static double fontSizeSmall = 16.0;
  static double fontSizeMin = 12.0;

  static double fontSizeByScreenSize(double size, double screen)
  {
    double coefficient = 0.05;
    return sqrt(size * screen * coefficient);
  }

  //UI별 변수
  static double taskBoxHeightCoefficient = 0.1;

  static double completedTaskBarCoefficient = 0.07;
  static double completedTaskBoxCoefficient = 0.15;

  static double addTaskDialogXCoefficient = 0.5;
  static double addTaskDialogYCoefficient = 0.3;
  static double addTaskDialogSpaceCoefficient = 0.1;
}