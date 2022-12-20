import 'package:edubrain/constants/constant.dart';
import 'package:edubrain/constants/fontstyle_constants.dart';
import 'package:edubrain/student/contents_screens/assignments/student_assignment_screen.dart';
import 'package:edubrain/student/contents_screens/fee_payments/student_fee_payments_screen.dart';
import 'package:edubrain/student/contents_screens/grades/grades_screen.dart';
import 'package:edubrain/student/contents_screens/time_table/student_time_table_screen.dart';
import 'package:edubrain/student/home_screen/cards_home/cards_home_screen.dart';
import 'package:edubrain/student/home_screen/student_details/student_data.dart';
import 'package:edubrain/student/student_profile/student_profile_screen.dart';
import 'package:flutter/material.dart';

class StudentHomeScreen extends StatelessWidget {
  const StudentHomeScreen({super.key});
  static String routeName = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
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
                          children: const [
                            StudentNameInfo(studentName: "Jabir"),
                            jHalfHeightBox,
                            StudentClassRegisterInfo(
                                studentRegisterInfos:
                                    'Class XII CS | Roll No. : 24'),
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
                              // Navigator.pushNamed(
                              //     context, StudentAttendanceScreen.routeName);
                            },
                            progressTitle: 'Attendance'),
                        StudentProgressInfo(
                            progressValue: "5350 \u{20B9}",
                            onPress: () {
                              Navigator.pushNamed(
                                  context, StudentFeePaymentScreen.routeName);
                            },
                            progressTitle: 'Fees Due')
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
                            Navigator.pushNamed(
                                context, StudentGradesScreen.routeName);
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
