// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:edubrain/comon_screens/login_direct/direct_login.dart';
import 'package:edubrain/constants/constant.dart';
import 'package:edubrain/database/functions/student_section.dart';
import 'package:edubrain/database/functions/teacher_section.dart';
import 'package:edubrain/database/model/student/student_data_model.dart';
import 'package:edubrain/database/model/teacher_model/teacher_data_model.dart';
import 'package:edubrain/main.dart';
import 'package:edubrain/student/home_screen/student_home_screen.dart';
import 'package:edubrain/student/login_screen/student_login_screen.dart';
import 'package:edubrain/teacher/home_screen/teacher_home_screen.dart';
import 'package:edubrain/teacher/login_screen/login_teacher/teacher_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static String routeName = 'SplashScreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    log('Splash Screen');
    log('init state values');

    super.initState();
    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                "assets/images/app-logo.png",
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
              ),
              TextLiquidFill(
                boxHeight: 150,
                text: "EduBrain",
                waveColor: jWhiteTextColor,
                waveDuration: const Duration(seconds: 3),
                loadDuration: const Duration(seconds: 2),
                boxBackgroundColor: jPrimaryColor,
                textStyle: GoogleFonts.akayaTelivigala(
                  color: jPrimaryColor,
                  fontSize: 75,
                  fontWeight: FontWeight.bold,
                  // letterSpacing: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
// ------------------- MY  STYLE OF CHECKING PREVIOUS LOGIN --------------------

  Future<void> goToLoginDirectPage() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const LoginDirect(),
      ),
    );
  }

  Future<void> checkLogin() async {
    final sharedPrefsteacher = await SharedPreferences.getInstance();
    final userTeacherSplash = sharedPrefsteacher.getBool(teacherSaveKey);
    final sharedPrefsStudent = await SharedPreferences.getInstance();

    final userStudent = sharedPrefsStudent.getBool(studentSaveKey);
    log(userStudent.toString(), name: 'Student sharedPref value');

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
      goToLoginDirectPage();
      log('value check 1');
    } else if (userTeacherSplash == true && userStudent == null ||
        userStudent == false) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const TeacherHomeScreen(),
      ));
      log('value check 2');
    } else if (userStudent == true && userTeacherSplash == false) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const StudentHomeScreen(),
      ));
      log('value check 3');
    }
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
