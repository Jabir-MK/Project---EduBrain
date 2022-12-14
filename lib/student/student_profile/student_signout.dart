// ignore_for_file: use_build_context_synchronously

import 'package:edubrain/constants/constant.dart';
import 'package:edubrain/constants/fontstyle_constants.dart';
import 'package:edubrain/student/login_screen/student_login_screen.dart';
import 'package:flutter/material.dart';

void signOutStudent(BuildContext context) async {
  // final sharedpref = await SharedPreferences.getInstance();
  // await sharedpref.clear();

  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const StudentLoginScreen()),
      (route) => false);
}

void confirmSignOutStudent(BuildContext context) {
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
              signOutStudent(context);
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
