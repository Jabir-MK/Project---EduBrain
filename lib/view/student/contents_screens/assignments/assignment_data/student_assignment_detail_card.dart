import 'package:edubrain/constants/constant.dart';
import 'package:edubrain/constants/fontstyle_constants.dart';
import 'package:flutter/material.dart';

class StudentAssignmentCards extends StatelessWidget {
  const StudentAssignmentCards({
    super.key,
    required this.detailsTitle,
    required this.detailsStatusValue,
  });

  final String detailsTitle;
  final String detailsStatusValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          detailsTitle,
          style: jAlegrayaSansHeadTextStyle,
        ),
        Text(
          detailsStatusValue,
          style: jAlegrayaSansSubTextStyle,
        ),
      ],
    );
  }
}

class StudentAssignmentSubmitButton extends StatelessWidget {
  const StudentAssignmentSubmitButton({
    super.key,
    required this.title,
    required this.onPress,
  });
  final String title;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                jSecondaryColor,
                jPrimaryColor,
              ],
              begin: FractionalOffset(0, 0),
              end: FractionalOffset(0.5, 0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
            borderRadius: BorderRadius.circular(jDefaultPadding)),
        child: Center(
          child: Text(
            title,
            style: jAlegrayaSansButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
