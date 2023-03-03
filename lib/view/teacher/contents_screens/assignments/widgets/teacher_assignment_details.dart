import 'package:edubrain/core/constants/fontstyle_constants.dart';
import 'package:flutter/material.dart';

class TeacherAssignmentCards extends StatelessWidget {
  const TeacherAssignmentCards({
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
