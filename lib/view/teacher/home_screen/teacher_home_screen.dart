import 'package:edubrain/constants/constant.dart';
import 'package:edubrain/constants/fontstyle_constants.dart';
import 'package:edubrain/database/functions/teacher_section.dart';
import 'package:edubrain/view/teacher/contents_screens/assignments/teacher_assignment_screen.dart';
import 'package:edubrain/view/teacher/contents_screens/grades/grades_studentlist_screen.dart';
import 'package:edubrain/view/teacher/contents_screens/manage_student/student_manage.dart';
import 'package:edubrain/view/teacher/contents_screens/time_table/teacher_time_table_screen.dart';
import 'package:edubrain/view/teacher/home_screen/drawer/drawer_home.dart';
import 'package:edubrain/view/teacher/home_screen/cards_home/teachers_cards_home.dart';
import 'package:edubrain/view/teacher/home_screen/teacher_details/teacher_data.dart';
import 'package:edubrain/view/teacher/login_screen/login_teacher/teacher_login_screen.dart';
import 'package:edubrain/view/teacher/teacher_profile/teacher_profile_screen.dart';
import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class TeacherHomeScreen extends StatefulWidget {
  const TeacherHomeScreen({super.key});
  static String routeName = 'TeacherHomeScreen';

  @override
  State<TeacherHomeScreen> createState() => _TeacherHomeScreenState();
}

class _TeacherHomeScreenState extends State<TeacherHomeScreen> {
  @override
  void initState() {
    userTeacher;
    getTeacherProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const HomeScreenDrawer(),
      appBar: AppBar(
        title: const Text(
          "EduBrain",
          style: jAkayaTelivigalaAppDefaultStyle,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return TeacherProfileScreen(
                        teacherFullName: userTeacher!.teacherName,
                        teacherRegID: userTeacher!.teacherRegID,
                        teacherGender: userTeacher!.teacherGender,
                        teacherSubject: userTeacher!.teacherSubject,
                        teacherQualification: userTeacher!.teacherQualification,
                        teacherEMail: userTeacher!.teacherEMail,
                        teacherMobileNum: userTeacher!.teacherMobileNum,
                        teacherPassword: userTeacher!.teacherPassword,
                      );
                    },
                  ),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                padding: const EdgeInsets.all(jDefaultPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TeacherNameInfo(
                              teacherName: userTeacher!.teacherName,
                            ),
                            jHalfHeightBox,
                            TeacherRegisterInfo(
                              teacherSubject: userTeacher!.teacherSubject,
                              teacherID: userTeacher!.teacherRegID,
                            ),
                            jHalfHeightBox,
                          ],
                        ),
                        jHalfHeightBox,
                        TeacherImageInfo(
                          onPress: () {},
                          studentImageAddress: "assets/images/teacher.png",
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: jOtherColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(jDefaultPadding * 3),
                    topRight: Radius.circular(jDefaultPadding * 3),
                  ),
                ),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TeacherHomeScreenCards(
                          onPress: () {
                            Navigator.pushNamed(
                                context, TeacherAssignmentsScreen.routeName);
                          },
                          iconImage: "assets/images/assignments.png",
                          cardTitle: 'Assignments',
                        ),
                        //    Grades section
                        TeacherHomeScreenCards(
                          onPress: () {
                            Navigator.pushNamed(
                                context, TeacherGradesScreen.routeName);
                          },
                          iconImage: "assets/images/grades.png",
                          cardTitle: 'Grades',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TeacherHomeScreenCards(
                          onPress: () {
                            Navigator.pushNamed(
                                context, TeacherTimeTableScreen.routeName);
                          },
                          iconImage: "assets/images/time-table.png",
                          cardTitle: "Time Table",
                        ),
                        //    TeachersInfo
                        TeacherHomeScreenCards(
                          onPress: () {
                            Navigator.pushNamed(
                                context, TeacherStudentManage.routeName);
                          },
                          iconImage: "assets/images/managestudent.png",
                          cardTitle: "Students",
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
