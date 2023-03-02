// ignore_for_file: use_build_context_synchronously

import 'package:edubrain/comon_screens/login_direct/direct_login.dart';
import 'package:edubrain/constants/constant.dart';
import 'package:edubrain/constants/fontstyle_constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void signOutStudent(BuildContext context) async {
  final sharedPrefsStudent = await SharedPreferences.getInstance();
  await sharedPrefsStudent.clear();
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const LoginDirect()),
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
