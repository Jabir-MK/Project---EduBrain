import 'package:edubrain/constants/constant.dart';
import 'package:edubrain/view/teacher/login_screen/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.elevation,
    required this.onPressAction,
    required this.text,
  });
  final double elevation;
  final VoidCallback onPressAction;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(elevation),
        shadowColor: MaterialStateProperty.all(jSecondaryColor),
        backgroundColor: MaterialStateProperty.all(jPrimaryColor),
      ),
      onPressed: onPressAction
      // () {
      // Navigator.pushReplacementNamed(context, TeacherSignUpScreen.routeName);
      // },
      ,
      child: Text(text),
    );
  }
}
