import 'package:edubrain/constants/attendance/style_attendance.dart';
import 'package:edubrain/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class StudentAttendanceCard extends StatelessWidget {
  const StudentAttendanceCard({
    super.key,
    required this.headText,
    required this.contentText,
  });

  final String headText;
  final int contentText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(jDefaultPadding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: jOtherColor,
          boxShadow: const [
            BoxShadow(
              color: jSecondaryColor,
              blurRadius: 10,
              blurStyle: BlurStyle.inner,
              offset: Offset(10, 10),
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            headText,
            style: jAttendanceHeadingAcmeTextStyle,
          ),
          jHalfHeightBox,
          LinearPercentIndicator(
            trailing: Row(
              children: [
                Text(
                  contentText.toString(),
                  style: jAttendanceContentTextStyle,
                ),
                const Text(
                  '%',
                  style: jAttendanceContentTextStyle,
                )
              ],
            ),
            animation: true,
            animationDuration: 1500,
            lineHeight: 20,
            percent: contentText / 100,
            progressColor: Colors.blue.shade100,
            backgroundColor: jPrimaryColor,
            barRadius: const Radius.circular(jDefaultPadding * 2),
          )
        ],
      ),
    );
  }
}
