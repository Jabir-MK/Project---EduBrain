import 'package:edubrain/constants/fontstyle_constants.dart';
import 'package:flutter/material.dart';

class TeacherGradesScreen extends StatelessWidget {
  const TeacherGradesScreen({super.key});
  static String routeName = 'TeacherGradesScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Grades",
          style: jAkayaTelivigalaAppDefaultStyle,
        ),
      ),
    );
  }
}
