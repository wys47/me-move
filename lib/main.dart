import 'package:flutter/material.dart';
import 'package:memove_practice/data/task_data.dart';
import 'package:memove_practice/theme/theme.dart';
import 'package:provider/provider.dart';

import 'modules/home/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        title: 'me-move',
        theme: AppTheme.getTheme(),
        debugShowCheckedModeBanner: false, // 배포시 주의
        home: HomePage(),
      ),
    );
  }
}