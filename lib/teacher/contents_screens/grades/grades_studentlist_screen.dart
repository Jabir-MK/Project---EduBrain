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
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ViewIndividualStudentGradesScreen(
                          index: index,
                        ),
                      ));
                },
                child: Container(
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
                        children: [
                          const CircleAvatar(),
                          jWidthBox,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${studentData.fName.toUpperCase()} '
                                '${studentData.lName.toUpperCase()}',
                                style: jTimeTableTeacherNameTextStyle,
                              ),
                              Text(
                                studentData.regNum.toUpperCase(),
                                style: jTimeTablePeriodTextStyle,
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
                  // ListTile(
                  //   selected: true,
                  //   selectedTileColor: jWhiteTextColor,
                  //   hoverColor: jWhiteTextColor,

                  //   leading: const CircleAvatar(
                  //     radius: 30,
                  //     backgroundImage: AssetImage('assets/images/student.png'),
                  //   ),
                  //   title: Text(
                  //     studentData.fName + studentData.lName,
                  //     style: jTimeTableTeacherNameTextStyle,
                  //   ),
                  //   subtitle: Text(
                  //     studentData.regNum,
                  //     style: jTimeTablePeriodTextStyle,
                  //   ),
                  // )
                  ;
            },
          );
        },
      ),
    );
  }
}
