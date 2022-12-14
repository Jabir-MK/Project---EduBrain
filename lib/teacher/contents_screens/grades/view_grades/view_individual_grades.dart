import 'package:edubrain/constants/constant.dart';
import 'package:edubrain/constants/fontstyle_constants.dart';
import 'package:edubrain/database/functions/student_section.dart';
import 'package:edubrain/teacher/contents_screens/grades/view_grades/add_grade_screen.dart';
import 'package:edubrain/teacher/contents_screens/grades/view_grades/view_individual_grades_details.dart';
import 'package:flutter/material.dart';

class ViewIndividualStudentGradesScreen extends StatefulWidget {
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
                      widget.name,
                      style: const TextStyle(
                        fontFamily: 'Kalam',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.regID,
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
                      widget.admNo,
                      style: const TextStyle(
                        fontFamily: 'Kalam',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.dept,
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
          ValueListenableBuilder(
            builder: (context, studentGradesInfo, child) {
              return Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddGradesScreen(),
                        ),
                      );
                    },
                    child: const Text('Add Grades'),
                  ),
                  const IndividualGradesProgressIndicator(
                    subjectMark: 74,
                    subjectName: 'English',
                    progressColor: Colors.blue,
                  ),
                  jHalfHeightBox,
                  const IndividualGradesProgressIndicator(
                    subjectMark: 73,
                    subjectName: 'Language',
                    progressColor: Colors.red,
                  ),
                  jHalfHeightBox,
                  const IndividualGradesProgressIndicator(
                    subjectMark: 69,
                    subjectName: 'Mathematics',
                    progressColor: Colors.green,
                  ),
                  jHalfHeightBox,
                  const IndividualGradesProgressIndicator(
                    subjectMark: 42,
                    subjectName: 'Chemistry',
                    progressColor: Colors.purple,
                  ),
                  jHalfHeightBox,
                  const IndividualGradesProgressIndicator(
                    subjectMark: 53,
                    subjectName: 'Physics',
                    progressColor: Colors.yellow,
                  ),
                  jHalfHeightBox,
                  const IndividualGradesProgressIndicator(
                    subjectMark: 54,
                    subjectName: 'Computer Science',
                    progressColor: Colors.orange,
                  ),
                ],
              );
            },
            valueListenable: studentListNotifier,
          )
        ],
      ),
    );
  }
}
