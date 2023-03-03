import 'dart:ffi';

import 'package:edubrain/view/teacher/login_screen/login_teacher/teacher_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../../../constants/constant.dart';

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget({
    super.key,
    required this.text,
    required this.onPressAction,
  });

  final String text;
  final VoidCallback onPressAction;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressAction,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(jPrimaryColor),
      ),
      child: Text(
        text,
      ),
    );
  }
}
