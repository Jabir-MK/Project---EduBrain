import 'package:edubrain/constants/constant.dart';
import 'package:edubrain/constants/fontstyle_constants.dart';
import 'package:edubrain/database/functions/grades_section.dart';
import 'package:edubrain/database/model/grades/grades_model.dart';
import 'package:flutter/material.dart';

class AddGradesScreen extends StatefulWidget {
  const AddGradesScreen({super.key});

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
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'English',
                      style: jAssignmentTextStyle,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: TextFormField(
                        controller: _englishController,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Field Cannot be empty';
                          }
                          return null;
                        },
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Language',
                      style: jAssignmentTextStyle,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: TextFormField(
                        controller: _languageController,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Field Cannot be empty';
                          }
                          return null;
                        },
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Computer Science',
                      style: jAssignmentTextStyle,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: TextFormField(
                        controller: _computerController,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Field Cannot be empty';
                          }
                          return null;
                        },
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Chemistry',
                      style: jAssignmentTextStyle,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: TextFormField(
                        controller: _chemistryController,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Field Cannot be empty';
                          }
                          return null;
                        },
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Physics',
                      style: jAssignmentTextStyle,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: TextFormField(
                        controller: _physicsController,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Field Cannot be empty';
                          }
                          return null;
                        },
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Mathematics',
                      style: jAssignmentTextStyle,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: TextFormField(
                        controller: _mathsController,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Field Cannot be empty';
                          }
                          return null;
                        },
                      ),
                    )
                  ],
                ),
                jheightBox,
                ElevatedButton.icon(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      addGradesOnTap();
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
    );
  }

  Future<void> addGradesOnTap() async {
    final english = _englishController.text.trim();
    final language = _englishController.text.trim();
    final chemistry = _englishController.text.trim();
    final computer = _englishController.text.trim();
    final mathematics = _englishController.text.trim();
    final physics = _englishController.text.trim();

    if (english.isEmpty ||
        language.isEmpty ||
        chemistry.isEmpty ||
        mathematics.isEmpty ||
        computer.isEmpty ||
        physics.isEmpty) {
      return;
    } else {
      // ignore: unused_local_variable
      final grades = GradesModel(
        englishMark: english,
        mathematicsMark: mathematics,
        languageMark: language,
        chemistryMark: chemistry,
        physicsMark: physics,
        computerMark: computer,
      );
      addGrades(grades);

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
