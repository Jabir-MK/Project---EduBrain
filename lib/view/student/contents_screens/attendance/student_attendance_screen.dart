import 'package:edubrain/core/constants/constant.dart';
import 'package:edubrain/core/constants/fontstyle_constants.dart';
import 'package:edubrain/view/student/contents_screens/attendance/student_attendance_data.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class StudentAttendanceScreen extends StatelessWidget {
  const StudentAttendanceScreen({super.key});

  static String routeName = 'StudentAttendanceScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Attendance",
          style: jAkayaTelivigalaAppDefaultStyle,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        children: [
          CircularPercentIndicator(
            radius: 150,
            animation: true,
            lineWidth: 30,
            progressColor: Colors.blue.shade100,
            percent: 0.94,
            animationDuration: 1500,
            backgroundColor: jPrimaryColor,
            circularStrokeCap: CircularStrokeCap.round,
            center: const Text(
              "94.3%",
              style: jPercentLargeTextStyle,
            ),
          ),
          jheightBox,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              jheightBox,
              StudentAttendanceCard(headText: 'This Month', contentText: 100),
              jheightBox,
              jheightBox,
              StudentAttendanceCard(headText: 'Previous Month', contentText: 93)
            ],
          ),
        ],
      ),
    );
  }
}
