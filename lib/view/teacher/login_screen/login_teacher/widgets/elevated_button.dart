import 'package:edubrain/core/constants/constant.dart';
import 'package:flutter/material.dart';

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
