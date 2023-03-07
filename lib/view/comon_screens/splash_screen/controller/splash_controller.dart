// ignore_for_file: use_build_context_synchronously

import 'package:edubrain/database/model/student/student_data_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../database/functions/student_section.dart';
import '../../../../database/functions/teacher_section.dart';
import '../../../../database/model/teacher_model/teacher_data_model.dart';
import '../../../../main.dart';
import '../../../student/home_screen/student_home_screen.dart';
import '../../../student/login_screen/student_login_screen.dart';
import '../../../teacher/home_screen/teacher_home_screen.dart';
import '../../../teacher/login_screen/login_teacher/teacher_login_screen.dart';
import '../../login_direct/direct_login.dart';

class SplashProvider with ChangeNotifier {
  Future<void> checkLogin(context) async {
    final sharedPrefsteacher = await SharedPreferences.getInstance();
    final userTeacherSplash = sharedPrefsteacher.getBool(teacherSaveKey);
    final sharedPrefsStudent = await SharedPreferences.getInstance();

    final userStudent = sharedPrefsStudent.getBool(studentSaveKey);

    final teacher = sharedPrefsStudent.getString('techerName');
    final teacherPass = sharedPrefsStudent.getString('techerPass');

    if (teacher != null && teacherPass != null) {
      Box<TeacherModel> profileCheckLoginTeacher =
          await Hive.openBox<TeacherModel>(teacherModelDatabaseName);
      profileCheckLoginTeacher.values
          .where((element) =>
              element.teacherEMail == teacher &&
              element.teacherPassword == teacherPass)
          .forEach(
        (element) {
          userTeacher = element;
          loginCheckTeacher(context);
          return;
        },
      );
    }

    final stytudent = sharedPrefsStudent.getString('StudentEmail');
    final studentPass = sharedPrefsStudent.getString('StudentPassword');

    if (stytudent != null && studentPass != null) {
      Box<StudentModel> profileCheckLoginStudent =
          await Hive.openBox<StudentModel>(studentModelDatabaseName);
      profileCheckLoginStudent.values
          .where(
        (element) =>
            element.eMail == stytudent && element.password == studentPass,
      )
          .forEach(
        (element) {
          studentLoginList.add(element);
          loginCheckStudent(context);
          return;
        },
      );
    }

    if ((userTeacher == null || userTeacherSplash == false) &&
        (userStudent == null || userStudent == false)) {
      goToLoginDirectPage(context);
    } else if (userTeacherSplash == true && userStudent == null ||
        userStudent == false) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const TeacherHomeScreen(),
      ));
    } else if (userStudent == true && userTeacherSplash == false) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const StudentHomeScreen(),
      ));
    }
  }

  Future<void> goToLoginDirectPage(context) async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const LoginDirect(),
      ),
    );
  }

  void loginCheckTeacher(BuildContext context) async {
    final sharedPrefTeacher = await SharedPreferences.getInstance();
    await sharedPrefTeacher.setBool(teacherSaveKey, true);
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const TeacherHomeScreen(),
    ));
  }

  void loginCheckStudent(BuildContext context) async {
    final sharedPrefTeacher = await SharedPreferences.getInstance();
    await sharedPrefTeacher.setBool(studentSaveKey, true);
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const StudentHomeScreen(),
    ));
  }
}
