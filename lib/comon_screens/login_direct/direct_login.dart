import 'package:edubrain/constants/constant.dart';
import 'package:edubrain/constants/fontstyle_constants.dart';
import 'package:edubrain/student/login_screen/student_login_screen.dart';
import 'package:edubrain/teacher/login_screen/signup/signup_screen.dart';
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
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, TeacherSignUpScreen.routeName);
                },
                child: Container(
                  height: 300,
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
                  child: const Center(
                    child: Text(
                      'Teacher',
                      style: jKalamXLargeStyle,
                    ),
                  ),
                ),
              ),
              jheightBox,
              jheightBox,
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, StudentLoginScreen.routeName);
                },
                child: Container(
                  height: 300,
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
                  child: const Center(
                    child: Text(
                      'Student',
                      style: jKalamXLargeStyle,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
