import 'package:edubrain/core/constants/constant.dart';
import 'package:edubrain/database/model/student/student_data_model.dart';
import 'package:edubrain/view/teacher/contents_screens/grades/add_grades/widgets/textformfield_row_widget.dart';
import 'package:edubrain/view/teacher/contents_screens/grades/controller/grades_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddGradesScreen extends StatelessWidget {
  const AddGradesScreen({super.key, required this.studentModel});

  final StudentModel studentModel;

  @override
  Widget build(BuildContext context) {
    final gradesProvider =
        Provider.of<GradesController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Grades'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: jDefaultPadding, vertical: jDefaultPadding / 2),
          child: Form(
            key: gradesProvider.formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormFieldRow(
                    rowTitle: 'English',
                    controller: gradesProvider.englishController,
                    returnValue: 'English mark not assigned',
                  ),
                  TextFormFieldRow(
                    rowTitle: 'Language',
                    controller: gradesProvider.languageController,
                    returnValue: 'Language mark not assigned',
                  ),
                  TextFormFieldRow(
                    rowTitle: 'Computer Science',
                    controller: gradesProvider.computerController,
                    returnValue: 'Computer Science mark not assigned',
                  ),
                  TextFormFieldRow(
                    rowTitle: 'Chemistry',
                    controller: gradesProvider.chemistryController,
                    returnValue: 'Chemistry mark not assigned',
                  ),
                  TextFormFieldRow(
                    rowTitle: 'Physics',
                    controller: gradesProvider.physicsController,
                    returnValue: 'Physics mark not assigned',
                  ),
                  TextFormFieldRow(
                    rowTitle: 'Mathematics',
                    controller: gradesProvider.mathsController,
                    returnValue: 'Mathematics mark not assigned',
                  ),
                  jheightBox,
                  ElevatedButton.icon(
                    onPressed: () {
                      if (gradesProvider.formKey.currentState!.validate()) {
                        gradesProvider.addGradesOnTap(context, studentModel);
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
}
