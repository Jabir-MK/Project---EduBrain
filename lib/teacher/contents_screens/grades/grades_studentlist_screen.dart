import 'package:edubrain/constants/constant.dart';
import 'package:edubrain/constants/fontstyle_constants.dart';
import 'package:edubrain/database/functions/db_functions.dart';
import 'package:edubrain/database/model/student/student_data_model.dart';
import 'package:edubrain/teacher/contents_screens/grades/view_grades/view_individual_grades.dart';
import 'package:flutter/material.dart';

class TeacherGradesScreen extends StatefulWidget {
  const TeacherGradesScreen({super.key});
  static String routeName = 'TeacherGradesScreen';

  @override
  State<TeacherGradesScreen> createState() => _TeacherGradesScreenState();
}

class _TeacherGradesScreenState extends State<TeacherGradesScreen> {
  @override
  void initState() {
    super.initState();
    getAllStudents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Grades",
          style: jAkayaTelivigalaAppDefaultStyle,
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: studentListNotifier,
        builder: (BuildContext context, List<StudentModel> studentList,
            Widget? child) {
          return ListView.separated(
            separatorBuilder: (context, index) {
              return const Divider(
                thickness: 2,
              );
            },
            itemCount: studentList.length,
            itemBuilder: (context, index) {
              final studentData = studentList[index];
              return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    selected: true,
                    selectedTileColor: jWhiteTextColor,
                    hoverColor: jWhiteTextColor,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const ViewIndividualStudentGradesScreen(),
                          ));
                    },
                    title: Text(studentData.fName + studentData.lName),
                    subtitle: Text(studentData.regNum),
                  ));
            },
          );
        },
      ),
    );
  }
}
