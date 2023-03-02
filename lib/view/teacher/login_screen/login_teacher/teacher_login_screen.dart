// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:edubrain/constants/constant.dart';
import 'package:edubrain/database/functions/teacher_section.dart';
import 'package:edubrain/database/model/teacher_model/teacher_data_model.dart';
import 'package:edubrain/main.dart';
import 'package:edubrain/view/teacher/home_screen/teacher_home_screen.dart';
import 'package:edubrain/view/teacher/login_screen/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shared_preferences/shared_preferences.dart';

TeacherModel? userTeacher;

class TeacherLoginScreen extends StatefulWidget {
  const TeacherLoginScreen({super.key});

  static String routeName = 'TeacherLoginScreen';

  @override
  State<TeacherLoginScreen> createState() => _TeacherLoginScreenState();
}

class _TeacherLoginScreenState extends State<TeacherLoginScreen> {
  final TextEditingController _teacherLoginDataController =
      TextEditingController();

  final TextEditingController _teacherLoginPassController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: ListView(
          children: [
            Container(
              color: jPrimaryColor,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/teacher.png",
                    height: 150,
                    width: 150,
                  ),
                  const Text(
                    "Hi Teacher",
                    style: TextStyle(
                      color: jWhiteTextColor,
                      fontFamily: 'Kalam',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Sign-in to continue.",
                    style: TextStyle(
                      color: jWhiteTextColor,
                      fontFamily: 'AkayaTelivigala',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(jDefaultPadding * 3),
                  topRight: Radius.circular(jDefaultPadding * 3),
                ),
                color: jOtherColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(jDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          jheightBox,
                          buildEmailField(),
                          jheightBox,
                          buildPasswordField(),
                          jheightBox,
                          jheightBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton.icon(
                                  style: ButtonStyle(
                                    elevation: MaterialStateProperty.all(10),
                                    shadowColor: MaterialStateProperty.all(
                                        jSecondaryColor),
                                    backgroundColor: MaterialStateProperty.all(
                                        jPrimaryColor),
                                  ),
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      checkTeacherLogin();
                                    }
                                  },
                                  icon: const Icon(Icons.check),
                                  label: const Text("Sign-In")),
                            ],
                          ),
                          jheightBox,
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'New here ? Sign-Up to Continue.',
                                style: TextStyle(
                                    color: jPrimaryColor,
                                    fontWeight: FontWeight.w600),
                              ),
                              jHalfHeightBox,
                              ElevatedButton(
                                style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(10),
                                  shadowColor: MaterialStateProperty.all(
                                      jSecondaryColor),
                                  backgroundColor:
                                      MaterialStateProperty.all(jPrimaryColor),
                                ),
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, TeacherSignUpScreen.routeName);
                                },
                                child: const Text('Create Account'),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  TextFormField buildEmailField() {
    return TextFormField(
      controller: _teacherLoginDataController,
      textAlign: TextAlign.start,
      keyboardType: TextInputType.emailAddress,
      style: const TextStyle(
        color: jBlackTextColor,
        fontWeight: FontWeight.w600,
        fontSize: 17,
      ),
      decoration: const InputDecoration(
        labelText: "E-mail ",
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

  TextFormField buildPasswordField() {
    return TextFormField(
      controller: _teacherLoginPassController,
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

  Future<void> checkTeacherLogin() async {
    final teacherLoginDataCheck = _teacherLoginDataController.text.trim();
    final teacherLoginPasswordCheck = _teacherLoginPassController.text.trim();

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
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const TeacherHomeScreen(),
    ));
  }
}
