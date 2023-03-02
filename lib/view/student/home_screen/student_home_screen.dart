import 'package:edubrain/constants/constant.dart';
import 'package:edubrain/constants/fontstyle_constants.dart';
import 'package:edubrain/view/student/contents_screens/assignments/student_assignment_screen.dart';
import 'package:edubrain/view/student/contents_screens/attendance/student_attendance_screen.dart';
import 'package:edubrain/view/student/contents_screens/fee_payments/student_fee_payments_screen.dart';
import 'package:edubrain/view/student/contents_screens/grades/grades_screen.dart';
import 'package:edubrain/view/student/contents_screens/time_table/student_time_table_screen.dart';
import 'package:edubrain/view/student/home_screen/cards_home/cards_home_screen.dart';
import 'package:edubrain/view/student/home_screen/drawer_home.dart/drawer_home.dart';
import 'package:edubrain/view/student/home_screen/student_details/student_data.dart';
import 'package:edubrain/view/student/login_screen/student_login_screen.dart';
import 'package:edubrain/view/student/student_profile/student_profile_screen.dart';
import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class StudentHomeScreen extends StatefulWidget {
  const StudentHomeScreen({super.key});
  static String routeName = 'HomeScreen';

  @override
  State<StudentHomeScreen> createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const StudentHomeScreenDrawer(),
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
                Navigator.of(context).pushNamed(StudentProfileScreen.routeName);
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.6,
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
                            StudentNameInfo(
                                studentName:
                                    '${studentLoginList[0].fName} ${studentLoginList[0].lName}'),
                            jHalfHeightBox,
                            StudentClassRegisterInfo(
                              studentRegisterInfos:
                                  '${studentLoginList[0].dept} | ${studentLoginList[0].regNum}',
                            ),
                            jHalfHeightBox,
                          ],
                        ),
                        jHalfHeightBox,
                        StudentImageInfo(
                            onPress: () {
                              Navigator.pushNamed(
                                  context, StudentProfileScreen.routeName);
                            },
                            studentImageAddress: "assets/images/student.png")
                      ],
                    ),
                    jheightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        StudentProgressInfo(
                          progressValue: "94.3 %",
                          onPress: () {
                            Navigator.pushNamed(
                                context, StudentAttendanceScreen.routeName);
                          },
                          progressTitle: 'Attendance',
                        ),
                        StudentProgressInfo(
                          progressValue: "5350 \u{20B9}",
                          onPress: () {
                            Navigator.pushNamed(
                                context, StudentFeePaymentScreen.routeName);
                          },
                          progressTitle: 'Fees Due',
                        )
                      ],
                    )
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
                        StudentHomeScreenCards(
                          onPress: () {
                            Navigator.pushNamed(
                                context, StudentAssignmentsScreen.routeName);
                          },
                          iconImage: "assets/images/assignments.png",
                          cardTitle: 'Assignments',
                        ),
                        //    Grades section
                        StudentHomeScreenCards(
                          onPress: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => StudentGradesScreen(
                                      studentModel: studentLoginList[0]),
                                ));
                          },
                          iconImage: "assets/images/grades.png",
                          cardTitle: 'Grades',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        StudentHomeScreenCards(
                          onPress: () {
                            Navigator.pushNamed(
                                context, StudentTimeTableScreen.routeName);
                          },
                          iconImage: "assets/images/time-table.png",
                          cardTitle: "Time Table",
                        ),
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
