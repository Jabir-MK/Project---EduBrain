import 'package:edubrain/core/constants/constant.dart';
import 'package:edubrain/database/functions/student_section.dart';
import 'package:edubrain/database/model/grades/grades_model.dart';
import 'package:edubrain/database/model/student/student_data_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GradesController with ChangeNotifier {
  //

  final TextEditingController englishController = TextEditingController();
  final TextEditingController languageController = TextEditingController();
  final TextEditingController physicsController = TextEditingController();
  final TextEditingController mathsController = TextEditingController();
  final TextEditingController chemistryController = TextEditingController();
  final TextEditingController computerController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  // Add Grades

  Future<void> addGradesOnTap(context, StudentModel studentModel) async {
    final english = englishController.text.trim();
    final language = languageController.text.trim();
    final chemistry = chemistryController.text.trim();
    final computer = computerController.text.trim();
    final mathematics = mathsController.text.trim();
    final physics = physicsController.text.trim();

    if (english.isEmpty ||
        language.isEmpty ||
        chemistry.isEmpty ||
        mathematics.isEmpty ||
        computer.isEmpty ||
        physics.isEmpty) {
      return;
    } else {
      final grades = GradesModel(
        englishMark: english,
        mathematicsMark: mathematics,
        languageMark: language,
        chemistryMark: chemistry,
        physicsMark: physics,
        computerMark: computer,
      );
      studentModel.grades = grades;
      await Provider.of<StudentDBProvider>(context, listen: false)
          .editStudent(studentModel.id!, studentModel);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: jSecondaryColor,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(jDefaultPadding),
          content: Text('Added Grades Successfully'),
          duration: Duration(seconds: 1),
        ),
      );
    }
  }
}
