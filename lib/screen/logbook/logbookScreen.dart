import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'components/body.dart';

class LogBookScreen extends StatefulWidget {
  static String routeName = '/logbookScreen';

  @override
  State<LogBookScreen> createState() => _LogBookScreenState();
}

class _LogBookScreenState extends State<LogBookScreen> {
  @override
  Widget build(BuildContext context) {
    return Body();
  }
}
