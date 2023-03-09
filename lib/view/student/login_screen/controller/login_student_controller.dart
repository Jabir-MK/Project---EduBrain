// ignore_for_file: use_build_context_synchronously

import 'package:edubrain/database/functions/student_section.dart';
import 'package:edubrain/database/model/student/student_data_model.dart';
import 'package:edubrain/main.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/constant.dart';
import '../../home_screen/student_home_screen.dart';
import '../student_login_screen.dart';
import 'package:provider/provider.dart';

class StudentLoginProvider with ChangeNotifier {
  final TextEditingController studentLoginDataController =
      TextEditingController();

  final TextEditingController studentLoginPassController =
      TextEditingController();

  final formKey = GlobalKey<FormState>();

  // Building Textfields

  TextFormField buildEmailField() {
    return TextFormField(
      controller: studentLoginDataController,
      textAlign: TextAlign.start,
      keyboardType: TextInputType.emailAddress,
      style: const TextStyle(
        color: jBlackTextColor,
        fontWeight: FontWeight.w600,
        fontSize: 17,
      ),
      decoration: const InputDecoration(
        labelText: "E-mail",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        isDense: true,
      ),
      validator: (value) {
        RegExp regExpEmail = RegExp(emailPattern);
        if (value == null || value.isEmpty) {
          return "Please Enter Your E-mail";
        }
        if (!regExpEmail.hasMatch(value)) {
          return 'Please enter a valid Email';
        }
        return null;
      },
    );
  }

  TextFormField buildPasswordField() {
    return TextFormField(
      controller: studentLoginPassController,
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
  // Check function

  Future<void> checkLoginStudent(context) async {
    final userStudentEmail = studentLoginDataController.text.trim();
    final userStudentPass = studentLoginPassController.text.trim();

    final sharedpref = await SharedPreferences.getInstance();
    await sharedpref.setString('StudentEmail', userStudentEmail);
    await sharedpref.setString('StudentPassword', userStudentPass);

    Box<StudentModel> studentLoginCheck = await Hive.openBox<StudentModel>(
        Provider.of<StudentDBProvider>(context, listen: false)
            .studentModelDatabaseName);
    studentLoginCheck.values
        .toList()
        .where((element) =>
            element.eMail == userStudentEmail &&
            element.password == userStudentPass)
        .forEach(
      (element) {
        studentLoginList.add(element);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const StudentHomeScreen(),
          ),
        );
      },
    );
    studentLoginDataController.clear();
    studentLoginPassController.clear();
  }

  void loginCheckStudent(BuildContext context) async {
    final sharedPrefStudent = await SharedPreferences.getInstance();
    await sharedPrefStudent.setBool(studentSaveKey, true);
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const StudentHomeScreen(),
    ));
  }
}
