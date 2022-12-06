import 'package:edubrain/constants/constant.dart';
import 'package:edubrain/constants/fontstyle_constants.dart';
import 'package:edubrain/database/functions/db_functions.dart';
import 'package:edubrain/teacher/contents_screens/assignments/teacher_assignment_screen.dart';
import 'package:edubrain/teacher/contents_screens/grades/grades_studentlist_screen.dart';
import 'package:edubrain/teacher/contents_screens/manage_student/student_manage.dart';
import 'package:edubrain/teacher/contents_screens/time_table/teacher_time_table_screen.dart';
import 'package:edubrain/teacher/home_screen/cards_home/teachers_cards_home.dart';
import 'package:edubrain/teacher/home_screen/teacher_details/teacher_data.dart';
import 'package:edubrain/teacher/teacher_profile/teacher_profile_screen.dart';
import 'package:flutter/material.dart';

class TeacherHomeScreen extends StatefulWidget {
  const TeacherHomeScreen({
    super.key,
    required this.subjectName,
    required this.regID,
    required this.signUpTeacherName,
    required this.signUpEMail,
    required this.signUpPassWord,
  });
  static String routeName = 'TeacherHomeScreen';

  final String signUpTeacherName;
  final String subjectName;
  final String regID;
  final String signUpEMail;
  final String signUpPassWord;
  @override
  State<TeacherHomeScreen> createState() => _TeacherHomeScreenState();
}

class _TeacherHomeScreenState extends State<TeacherHomeScreen> {
  late String teacherName;
  late String teacherSubjectName;
  late String teacherEMail;
  late String teacherRegID;
  late String teacherPassword;

  @override
  void initState() {
    super.initState();

    getTeacherProfile();

    teacherName = TextEditingController(text: widget.signUpTeacherName).text;
    teacherSubjectName = TextEditingController(text: widget.subjectName).text;
    teacherRegID = TextEditingController(text: widget.regID).text;
    teacherEMail = TextEditingController(text: widget.signUpEMail).text;
    teacherPassword = TextEditingController(text: widget.signUpPassWord).text;
  }

  @override
  Widget build(BuildContext context) {
    getTeacherProfile();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
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
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return TeacherProfileScreen(
                      teacherFullName: teacherName,
                      teacherGender: '',
                      teacherRegID: '',
                      teacherSubject: '',
                      teacherQualification: '',
                      teacherEMail: teacherEMail,
                      teacherMobileNum: '',
                      teacherPassword: teacherPassword,
                    );
                  },
                ));
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
                              teacherName: teacherName,
                            ),
                            jHalfHeightBox,
                            TeacherRegisterInfo(
                                teacherSubject: teacherSubjectName,
                                teacherID: teacherRegID),
                            jHalfHeightBox,
                          ],
                        ),
                        jHalfHeightBox,
                        TeacherImageInfo(
                            onPress: () {},
                            studentImageAddress: "assets/images/teacher.png")
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
