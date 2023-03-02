import 'package:edubrain/constants/fontstyle_constants.dart';
import 'package:flutter/material.dart';

class StudentViewAssignmentRow extends StatelessWidget {
  const StudentViewAssignmentRow({
    super.key,
    required this.detailTitle,
    required this.detailValue,
  });
  final String detailTitle;
  final String detailValue;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          detailTitle,
          style: jAssignmentTextStyle,
        ),
        Text(detailValue)
      ],
    );
  }
}
