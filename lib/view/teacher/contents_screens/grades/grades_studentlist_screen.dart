import 'package:edubrain/core/constants/constant.dart';
import 'package:edubrain/core/constants/fontstyle_constants.dart';
import 'package:edubrain/database/functions/student_section.dart';
import 'package:edubrain/database/model/student/student_data_model.dart';
import 'package:edubrain/view/teacher/contents_screens/grades/view_grades/view_individual_grades.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

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
    double widthFix = MediaQuery.of(context).size.width;
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
          return AnimationLimiter(
            child: ListView.builder(
              padding: EdgeInsets.all(widthFix / 30),
              physics: const BouncingScrollPhysics(),
              itemCount: studentList.length,
              itemBuilder: (context, index) {
                final studentData = studentList[index];
                return AnimationConfiguration.staggeredList(
                  position: index,
                  delay: const Duration(milliseconds: 100),
                  child: SlideAnimation(
                    duration: const Duration(milliseconds: 2500),
                    curve: Curves.fastLinearToSlowEaseIn,
                    verticalOffset: -250,
                    child: ScaleAnimation(
                      duration: const Duration(milliseconds: 1500),
                      curve: Curves.fastLinearToSlowEaseIn,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ViewIndividualStudentGradesScreen(
                                  index: index,
                                  admNo: studentData.admNum,
                                  dept: studentData.dept,
                                  name: studentData.fName,
                                  regID: studentData.regNum,
                                ),
                              ));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(jDefaultPadding),
                          margin: const EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                            color: jOtherColor,
                            borderRadius:
                                BorderRadius.circular(jDefaultPadding),
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
                                  const CircleAvatar(
                                    backgroundImage:
                                        AssetImage('assets/images/student.png'),
                                    radius: 30,
                                  ),
                                  jWidthBox,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
