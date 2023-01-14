import 'package:edubrain/comon_screens/login_direct/direct_login.dart';
import 'package:edubrain/student/contents_screens/assignments/student_assignment_screen.dart';
import 'package:edubrain/student/contents_screens/attendance/student_attendance_screen.dart';
import 'package:edubrain/student/contents_screens/fee_payments/student_fee_payments_screen.dart';
import 'package:edubrain/student/contents_screens/grades/grades_screen.dart';
import 'package:edubrain/student/contents_screens/teachers_info/student_teachers_info_screen.dart';
import 'package:edubrain/student/contents_screens/teachers_info/teacher_profileview/teacher_profile_view.dart';
import 'package:edubrain/student/contents_screens/time_table/student_time_table_screen.dart';
import 'package:edubrain/student/home_screen/student_home_screen.dart';
import 'package:edubrain/comon_screens/splash_screen/splash_screen.dart';
import 'package:edubrain/student/login_screen/student_login_screen.dart';
import 'package:edubrain/student/student_profile/student_profile_screen.dart';
import 'package:edubrain/teacher/contents_screens/assignments/new_assignment/new_assignment.dart';
import 'package:edubrain/teacher/contents_screens/assignments/teacher_assignment_screen.dart';
import 'package:edubrain/teacher/contents_screens/grades/grades_studentlist_screen.dart';
import 'package:edubrain/teacher/contents_screens/manage_student/add_student/add_student_screen.dart';

import 'package:edubrain/teacher/contents_screens/manage_student/student_manage.dart';
import 'package:edubrain/teacher/contents_screens/time_table/teacher_time_table_screen.dart';
import 'package:edubrain/teacher/home_screen/teacher_home_screen.dart';
import 'package:edubrain/teacher/login_screen/signup/signup_screen.dart';
import 'package:edubrain/teacher/login_screen/login_teacher/teacher_login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> routes = {
  // Common routes
  SplashScreen.routeName: (context) => const SplashScreen(),
  LoginDirect.routeName: (context) => const LoginDirect(),

  // Student routes
  StudentLoginScreen.routeName: (context) => const StudentLoginScreen(),
  StudentHomeScreen.routeName: (context) => const StudentHomeScreen(),
  StudentProfileScreen.routeName: (context) => const StudentProfileScreen(),
  StudentAssignmentsScreen.routeName: (context) =>
      const StudentAssignmentsScreen(),
  StudentAttendanceScreen.routeName: (context) =>
      const StudentAttendanceScreen(),
  StudentFeePaymentScreen.routeName: (context) =>
      const StudentFeePaymentScreen(),
  StudentGradesScreen.routeName: (context) => const StudentGradesScreen(),
  InStudentTeachersInfoScreen.routeName: (context) =>
      const InStudentTeachersInfoScreen(),
  StudentTimeTableScreen.routeName: (context) => const StudentTimeTableScreen(),
  // StudentViewAssignment.routeName: (context) => const StudentViewAssignment(),

  // Teacher routes
  TeacherLoginScreen.routeName: (context) => const TeacherLoginScreen(),
  TeacherAssignmentsScreen.routeName: (context) =>
      const TeacherAssignmentsScreen(),
  TeacherGradesScreen.routeName: (context) => const TeacherGradesScreen(),
  TeacherStudentManage.routeName: (context) => const TeacherStudentManage(),
  TeacherTimeTableScreen.routeName: (context) => const TeacherTimeTableScreen(),
  AddAssignmentScreen.routeName: (context) => const AddAssignmentScreen(),
  AddStudentScreen.routeName: (context) => const AddStudentScreen(),
  TeacherSignUpScreen.routeName: (context) => const TeacherSignUpScreen(),
  TeacherHomeScreen.routeName: (context) => const TeacherHomeScreen(),
// sample
  ViewTeacherProfile.routeName: (context) => const ViewTeacherProfile(),
};
