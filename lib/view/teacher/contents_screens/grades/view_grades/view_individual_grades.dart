import 'package:edubrain/core/constants/constant.dart';
import 'package:edubrain/core/constants/fontstyle_constants.dart';
import 'package:edubrain/database/functions/student_section.dart';
import 'package:edubrain/view/teacher/contents_screens/grades/view_grades/widgets/view_individual_grades_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../add_grades/add_grade_screen.dart';

class ViewIndividualStudentGradesScreen extends StatelessWidget {
  const ViewIndividualStudentGradesScreen({
    super.key,
    required this.index,
    required this.name,
    required this.regID,
    required this.admNo,
    required this.dept,
  });

  final String name;
  final String regID;
  final String admNo;
  final String dept;

  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Student Grade',
          style: jAkayaTelivigalaAppDefaultStyle,
        ),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(jDefaultPadding),
            margin: const EdgeInsets.all(jDefaultPadding),
            decoration: BoxDecoration(
              color: jOtherColor,
              borderRadius: BorderRadius.circular(jDefaultPadding),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(10, 10),
                  blurRadius: 10,
                  blurStyle: BlurStyle.inner,
                  color: jSecondaryColor,
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontFamily: 'Kalam',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      regID,
                      style: const TextStyle(
                        fontFamily: 'Kalam',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      admNo,
                      style: const TextStyle(
                        fontFamily: 'Kalam',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      dept,
                      style: const TextStyle(
                        fontFamily: 'Kalam',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Consumer<StudentDBProvider>(
            builder: (context, value, child) {
              return Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddGradesScreen(
                            studentModel: value.studentListDB[index],
                          ),
                        ),
                      );
                    },
                    child: const Text('Add Grades'),
                  ),
                  IndividualGradesProgressIndicator(
                    subjectMark: int.parse(
                        value.studentListDB[index].grades?.englishMark ??
                            'null'),
                    subjectName: 'English',
                    progressColor: Colors.blue,
                  ),
                  jHalfHeightBox,
                  IndividualGradesProgressIndicator(
                    subjectMark: int.parse(
                        value.studentListDB[index].grades?.languageMark ??
                            'null'),
                    subjectName: 'Language',
                    progressColor: Colors.red,
                  ),
                  jHalfHeightBox,
                  IndividualGradesProgressIndicator(
                    subjectMark: int.parse(
                        value.studentListDB[index].grades?.mathematicsMark ??
                            'null'),
                    subjectName: 'Mathematics',
                    progressColor: Colors.green,
                  ),
                  jHalfHeightBox,
                  IndividualGradesProgressIndicator(
                    subjectMark: int.parse(
                        value.studentListDB[index].grades?.chemistryMark ??
                            'null'),
                    subjectName: 'Chemistry',
                    progressColor: Colors.purple,
                  ),
                  jHalfHeightBox,
                  IndividualGradesProgressIndicator(
                    subjectMark: int.parse(
                        value.studentListDB[index].grades?.physicsMark ??
                            'null'),
                    subjectName: 'Physics',
                    progressColor: Colors.yellow,
                  ),
                  jHalfHeightBox,
                  IndividualGradesProgressIndicator(
                    subjectMark: int.parse(
                        value.studentListDB[index].grades?.computerMark ??
                            'null'),
                    subjectName: 'Computer Science',
                    progressColor: Colors.orange,
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
