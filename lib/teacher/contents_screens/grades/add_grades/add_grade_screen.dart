// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:edubrain/constants/constant.dart';
import 'package:edubrain/database/functions/student_section.dart';
import 'package:edubrain/database/model/grades/grades_model.dart';
import 'package:edubrain/database/model/student/student_data_model.dart';
import 'package:edubrain/teacher/contents_screens/grades/add_grades/widgets/textformfield_row_widget.dart';
import 'package:flutter/material.dart';

class AddGradesScreen extends StatefulWidget {
  const AddGradesScreen({super.key, required this.studentModel});

  final StudentModel studentModel;

  @override
  State<AddGradesScreen> createState() => _AddGradesScreenState();
}

class _AddGradesScreenState extends State<AddGradesScreen> {
  final TextEditingController _englishController = TextEditingController();
  final TextEditingController _languageController = TextEditingController();
  final TextEditingController _physicsController = TextEditingController();
  final TextEditingController _mathsController = TextEditingController();
  final TextEditingController _chemistryController = TextEditingController();
  final TextEditingController _computerController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Grades'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: jDefaultPadding, vertical: jDefaultPadding / 2),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormFieldRow(
                    rowTitle: 'English',
                    controller: _englishController,
                    returnValue: 'English mark not assigned',
                  ),
                  TextFormFieldRow(
                    rowTitle: 'Language',
                    controller: _languageController,
                    returnValue: 'Language mark not assigned',
                  ),
                  TextFormFieldRow(
                    rowTitle: 'Computer Science',
                    controller: _computerController,
                    returnValue: 'Computer Science mark not assigned',
                  ),
                  TextFormFieldRow(
                    rowTitle: 'Chemistry',
                    controller: _chemistryController,
                    returnValue: 'Chemistry mark not assigned',
                  ),
                  TextFormFieldRow(
                    rowTitle: 'Physics',
                    controller: _physicsController,
                    returnValue: 'Physics mark not assigned',
                  ),
                  TextFormFieldRow(
                    rowTitle: 'Mathematics',
                    controller: _mathsController,
                    returnValue: 'Mathematics mark not assigned',
                  ),
                  jheightBox,
                  ElevatedButton.icon(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        addGradesOnTap();
                        Navigator.pop(context);
                      }
                    },
                    icon: const Icon(Icons.check),
                    label: const Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> addGradesOnTap() async {
    final english = _englishController.text.trim();
    final language = _languageController.text.trim();
    final chemistry = _chemistryController.text.trim();
    final computer = _computerController.text.trim();
    final mathematics = _mathsController.text.trim();
    final physics = _physicsController.text.trim();

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
      log(grades.chemistryMark);
      widget.studentModel.grades = grades;
      await editStudent(widget.studentModel.id!, widget.studentModel);
      log(widget.studentModel.grades?.chemistryMark ?? 'null');
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
