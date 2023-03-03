import 'package:edubrain/core/constants/constant.dart';
import 'package:edubrain/core/constants/fontstyle_constants.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class IndividualGradesProgressIndicator extends StatelessWidget {
  const IndividualGradesProgressIndicator(
      {super.key,
      required this.subjectName,
      required this.subjectMark,
      required this.progressColor});
  final String subjectName;
  final int subjectMark;
  final Color progressColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(jDefaultPadding),
            child: Text(
              subjectName,
              style: jAcmeMediumStyle,
            ),
          ),
          LinearPercentIndicator(
            trailing: Text(
              subjectMark.toString(),
              style: const TextStyle(
                fontSize: 20,
                fontFamily: 'Kalam',
                fontWeight: FontWeight.bold,
                color: jWhiteTextColor,
              ),
            ),
            animation: true,
            animationDuration: 1500,
            lineHeight: 15,
            percent: subjectMark / 100,
            progressColor: progressColor,
            backgroundColor: jPrimaryColor,
            barRadius: const Radius.circular(jDefaultPadding * 2),
          ),
        ],
      ),
    );
  }
}
