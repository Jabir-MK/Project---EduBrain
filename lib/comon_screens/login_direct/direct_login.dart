import 'dart:developer';

import 'package:edubrain/constants/constant.dart';
import 'package:edubrain/constants/fontstyle_constants.dart';
import 'package:edubrain/view/student/login_screen/student_login_screen.dart';
import 'package:edubrain/view/teacher/login_screen/login_teacher/teacher_login_screen.dart';
import 'package:flutter/material.dart';

class LoginDirect extends StatelessWidget {
  const LoginDirect({super.key});
  static String routeName = 'DirectLoginScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(jDefaultPadding),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  "Who's logging in ?",
                  style: jKalamLargeStyle,
                ),
                jheightBox,
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, TeacherLoginScreen.routeName);
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height / 3.5,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [jSecondaryColor, jPrimaryColor],
                        begin: FractionalOffset(0, 0),
                        end: FractionalOffset(0.5, 0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp,
                      ),
                      borderRadius: BorderRadius.circular(jDefaultPadding),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 5,
                          offset: Offset(5, 5),
                          color: jOtherColor,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Center(
                          child: Text(
                            'Teacher',
                            style: jKalamLargeStyle,
                          ),
                        ),
                        Image.asset('assets/images/teacher.png')
                      ],
                    ),
                  ),
                ),
                jheightBox,
                jLargeSizedHeightBox,
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, StudentLoginScreen.routeName);
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height / 3.5,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [jPrimaryColor, jSecondaryColor],
                        begin: FractionalOffset(0, 0),
                        end: FractionalOffset(0.5, 0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp,
                      ),
                      borderRadius: BorderRadius.circular(jDefaultPadding),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 5,
                          offset: Offset(-5, -5),
                          color: jOtherColor,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          'assets/images/student.png',
                          width: MediaQuery.of(context).size.width / 2.2,
                        ),
                        const Center(
                          child: Text(
                            'Student',
                            style: jKalamLargeStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
