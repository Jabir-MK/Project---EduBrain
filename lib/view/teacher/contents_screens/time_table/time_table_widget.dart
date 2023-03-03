import 'package:edubrain/core/constants/constant.dart';
import 'package:edubrain/core/constants/fontstyle_constants.dart';
import 'package:edubrain/view/student/contents_screens/time_table/timetable_data/student_timetable_data.dart';
import 'package:edubrain/view/student/contents_screens/time_table/timetable_data/student_timetable_details_card.dart';
import 'package:flutter/material.dart';

class TimeTableDay extends StatelessWidget {
  const TimeTableDay({
    super.key,
    required this.lengthofday,
  });
  final int lengthofday;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(jDefaultPadding),
      itemCount: lengthofday,
      itemBuilder: (context, index) => Container(
        margin: const EdgeInsets.only(bottom: jDefaultPadding / 2),
        padding: const EdgeInsets.only(
            top: jDefaultPadding / 2,
            left: jDefaultPadding,
            right: jDefaultPadding / 2),
        decoration: BoxDecoration(
          color: jOtherColor,
          borderRadius: BorderRadius.circular(jDefaultPadding),
          boxShadow: const [
            BoxShadow(
                color: jSecondaryColor,
                blurRadius: 5,
                offset: Offset(10, 10),
                blurStyle: BlurStyle.inner),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              mondayTimeTable[index].subjectName,
              style: jTimeTableSubjectTextStyle,
            ),
            StudentTimeTableCards(
              content: mondayTimeTable[index].periodDuration,
              contentStyle: jTimeTablePeriodDurationTextStyle,
            ),
            jTwiceThickDivider,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StudentTimeTableCards(
                  content: mondayTimeTable[index].teacherName,
                  contentStyle: jTimeTableTeacherNameTextStyle,
                ),
                StudentTimeTableCards(
                  content: mondayTimeTable[index].periodNumber,
                  contentStyle: jTimeTablePeriodTextStyle,
                ),
              ],
            ),
            jHalfHeightBox
          ],
        ),
      ),
    );
  }
}
