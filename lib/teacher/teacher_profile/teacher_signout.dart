// ignore_for_file: use_build_context_synchronously

import 'package:edubrain/constants/constant.dart';
import 'package:edubrain/constants/fontstyle_constants.dart';
import 'package:edubrain/teacher/login_screen/teacher_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void signOutTeacher(BuildContext context) async {
  final sharedpref = await SharedPreferences.getInstance();
  await sharedpref.clear();

  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const TeacherLoginScreen()),
      (route) => false);
}

void confirmSignOutTeacher(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: jPrimaryColor,
        title: const Text(
          "Log Out",
          style: jAlegrayaSansTitleTextStyle,
        ),
        content: const Text(
          "You will be Logged Out",
          style: jKalamSmallStyle,
        ),
        actions: [
          TextButton(
            onPressed: () {
              signOutTeacher(context);
            },
            child: const Text(
              "Yes",
              style: jKalamXSmallStyle,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              "No",
              style: jKalamXSmallStyle,
            ),
          )
        ],
      );
    },
  );
}
