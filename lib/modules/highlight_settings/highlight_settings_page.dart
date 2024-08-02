import 'package:flutter/material.dart';

class HighlightSettingsPage extends StatefulWidget {
  const HighlightSettingsPage({Key? key}) : super(key: key);

  @override
  State<HighlightSettingsPage> createState() => _HighlightSettingsPageState();
}

class _HighlightSettingsPageState extends State<HighlightSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Highlight Settings'),
      ),
      body: Center(
        child: Text('Test'),
      ),
    );
  }
}