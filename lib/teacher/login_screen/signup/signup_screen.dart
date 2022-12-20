import 'dart:developer';

import 'package:edubrain/constants/constant.dart';
import 'package:edubrain/database/functions/db_functions.dart';
import 'package:edubrain/database/model/teacher_model/teacher_data_model.dart';
import 'package:edubrain/teacher/home_screen/teacher_home_screen.dart';
import 'package:edubrain/teacher/login_screen/teacher_login_screen.dart';
import 'package:flutter/material.dart';

class TeacherSignUpScreen extends StatefulWidget {
  const TeacherSignUpScreen({super.key});

  static String routeName = 'TeacherSignUpScreen';

  @override
  State<TeacherSignUpScreen> createState() => _TeacherSignUpScreenState();
}

class _TeacherSignUpScreenState extends State<TeacherSignUpScreen> {
  final TextEditingController _signUpUserNameController =
      TextEditingController();
  final TextEditingController _signUpEmailController = TextEditingController();
  final TextEditingController _signUpPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              color: jPrimaryColor,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/teacher.png",
                    height: 100,
                    width: 150,
                  ),
                  jHalfHeightBox,
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
                    "Create an Account.",
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
            Expanded(
              child: Container(
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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextFormField(
                          controller: _signUpUserNameController,
                          textAlign: TextAlign.start,
                          keyboardType: TextInputType.name,
                          style: const TextStyle(
                            color: jBlackTextColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                          decoration: const InputDecoration(
                            labelText: "Username",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            isDense: true,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please Enter Username";
                            } else {
                              return null;
                            }
                          },
                        ),
                        jheightBox,
                        TextFormField(
                          controller: _signUpEmailController,
                          textAlign: TextAlign.start,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(
                            color: jBlackTextColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                          ),
                          decoration: const InputDecoration(
                            labelText: "Mobile Number/Email",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            isDense: true,
                          ),
                          validator: (value) {
                            RegExp regExp = RegExp(emailPattern);
                            if (value == null || value.isEmpty) {
                              return "Please Enter Your Number/E-mail";
                            } else if (!regExp.hasMatch(value)) {
                              return "Please enter valid details";
                            }
                            return null;
                          },
                        ),
                        jheightBox,
                        TextFormField(
                          controller: _signUpPasswordController,
                          obscureText: true,
                          textAlign: TextAlign.start,
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
                        ),
                        jheightBox,
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              signUpteacherOnTap();
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const TeacherHomeScreen(),
                                  ));
                            } else {}
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(jPrimaryColor)),
                          child: const Text('Create Account'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Already a member ?',
                              style: TextStyle(
                                  color: jPrimaryColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, TeacherLoginScreen.routeName);
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(jPrimaryColor)),
                              child: const Text(
                                'Login',
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> signUpteacherOnTap() async {
    final signUpUserNameTeacher = _signUpUserNameController.text.trim();
    final signUpEMailTeacher = _signUpEmailController.text.trim();
    final signUpPasswordTeacher = _signUpPasswordController.text.trim();
    if (signUpUserNameTeacher.isEmpty ||
        signUpEMailTeacher.isEmpty ||
        signUpPasswordTeacher.isEmpty) {
      return;
    } else {
      // --------------------------------
      final teacher = TeacherModel(
        teacherName: signUpUserNameTeacher,
        teacherEMail: signUpEMailTeacher,
        teacherPassword: signUpPasswordTeacher,
        teacherGender: '',
        teacherMobileNum: '',
        teacherQualification: '',
        teacherRegID: '',
        teacherSubject: '',
      );
      createTeacherProfile(teacher);
      log(teacher.teacherEMail);
      log(teacher.teacherName);
      log(teacher.teacherPassword);
      log(teacher.teacherMobileNum);

      // -------------------------------
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: jSecondaryColor,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(jDefaultPadding),
          content: Text('Account has been created'),
        ),
      );
      log(teacher.teacherName);
      log(teacher.teacherEMail);
      log(teacher.teacherPassword);
      log(teacher.teacherGender);
      log(teacher.teacherMobileNum);
      log(teacher.teacherRegID);
      log(teacher.teacherSubject);
      log(teacher.teacherQualification);
    }
  }
}
