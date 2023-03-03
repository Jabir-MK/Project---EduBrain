// ignore_for_file: use_build_context_synchronously

import 'package:edubrain/core/constants/constant.dart';
import 'package:edubrain/database/functions/teacher_section.dart';
import 'package:edubrain/database/model/teacher_model/teacher_data_model.dart';
import 'package:edubrain/main.dart';
import 'package:edubrain/view/teacher/login_screen/login_teacher/teacher_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../view/teacher/home_screen/teacher_home_screen.dart';

class TeacherLoginProvider with ChangeNotifier {
  /*  Teacher Login Section */

  final TextEditingController teacherLoginDataController =
      TextEditingController();

  final TextEditingController teacherLoginPassController =
      TextEditingController();

  final formKey = GlobalKey<FormState>();

  // Check Teacher Login Function

  Future<void> checkTeacherLogin(
    context,
    data,
    password,
  ) async {
    final teacherLoginDataCheck = data.text.trim();
    final teacherLoginPasswordCheck = password.text.trim();

    final shredpref = await SharedPreferences.getInstance();
    await shredpref.setString('techerName', teacherLoginDataCheck);
    await shredpref.setString('techerPass', teacherLoginPasswordCheck);

    Box<TeacherModel> profileCheckLoginTeacher =
        await Hive.openBox<TeacherModel>(teacherModelDatabaseName);
    profileCheckLoginTeacher.values
        .where((element) =>
            element.teacherEMail == teacherLoginDataCheck &&
            element.teacherPassword == teacherLoginPasswordCheck)
        .forEach(
      (element) {
        userTeacher = element;
        loginCheckTeacher(context);
      },
    );
  }

  void loginCheckTeacher(BuildContext context) async {
    final sharedPrefTeacher = await SharedPreferences.getInstance();
    await sharedPrefTeacher.setBool(teacherSaveKey, true);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const TeacherHomeScreen(),
      ),
    );

    teacherLoginDataController.clear();
    teacherLoginPassController.clear();
  }

  //  Build Password Textfield
  TextFormField buildPasswordField(TextEditingController controller) {
    return TextFormField(
      controller: controller,
      textAlign: TextAlign.start,
      obscureText: true,
      keyboardType: TextInputType.name,
      style: const TextStyle(
        color: jBlackTextColor,
        fontWeight: FontWeight.w600,
        fontSize: 17,
      ),
      decoration: const InputDecoration(
        labelText: "Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        isDense: true,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Password not filled";
        } else if (value.length < 8) {
          return 'Password must be atleast 8 characters';
        } else {
          return null;
        }
      },
    );
  }

  // Build Email TextField
  TextFormField buildEmailField(TextEditingController controller) {
    return TextFormField(
      controller: controller,
      textAlign: TextAlign.start,
      obscureText: true,
      keyboardType: TextInputType.name,
      style: const TextStyle(
        color: jBlackTextColor,
        fontWeight: FontWeight.w600,
        fontSize: 17,
      ),
      decoration: const InputDecoration(
        labelText: "E-Mail",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        isDense: true,
      ),
      validator: (value) {
        RegExp regExp = RegExp(emailPattern);
        if (value == null || value.isEmpty) {
          return "Please Enter Your E-mail";
        } else if (!regExp.hasMatch(value)) {
          return "Please enter valid Email";
        } else {
          return null;
        }
      },
    );
  }
}
