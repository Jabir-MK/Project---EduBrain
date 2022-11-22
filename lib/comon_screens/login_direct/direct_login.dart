import 'package:edubrain/student/login_screen/student_login_screen.dart';
import 'package:edubrain/teacher/login_screen/teacher_login_screen.dart';
import 'package:flutter/material.dart';

class LoginDirect extends StatelessWidget {
  const LoginDirect({super.key});
  static String routeName = 'DirectLoginScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  // navigate to Teacher login
                  Navigator.of(context).pushNamed(TeacherLoginScreen.routeName);
                },
                icon: const Icon(Icons.group),
                label: const Text("Teacher"),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  // navigate to student login
                  Navigator.of(context).pushNamed(StudentLoginScreen.routeName);
                },
                icon: const Icon(Icons.person),
                label: const Text("Student"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
