import 'package:edubrain/constants/fontstyle_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ViewIndividualStudentGradesScreen extends StatefulWidget {
  const ViewIndividualStudentGradesScreen({super.key});

  @override
  State<ViewIndividualStudentGradesScreen> createState() =>
      _ViewIndividualStudentGradesScreenState();
}

class _ViewIndividualStudentGradesScreenState
    extends State<ViewIndividualStudentGradesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Student Grade',
          style: jAkayaTelivigalaAppDefaultStyle,
        ),
      ),
    );
  }
}
