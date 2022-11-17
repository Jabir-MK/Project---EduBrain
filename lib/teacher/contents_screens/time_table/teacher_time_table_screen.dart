import 'package:edubrain/constants/fontstyle_constants.dart';
import 'package:flutter/material.dart';

class TeacherTimeTableScreen extends StatelessWidget {
  const TeacherTimeTableScreen({super.key});
  static String routeName = "TeacherTimeTableScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Time Table",
          style: jAkayaTelivigalaAppDefaultStyle,
        ),
      ),
    );
  }
}
