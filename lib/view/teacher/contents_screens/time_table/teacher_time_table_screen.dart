import 'package:edubrain/core/constants/constant.dart';
import 'package:edubrain/core/constants/fontstyle_constants.dart';
import 'package:edubrain/view/student/contents_screens/time_table/timetable_data/student_timetable_data.dart';
import 'package:edubrain/view/student/contents_screens/time_table/timetable_data/student_timetable_details_card.dart';
import 'package:flutter/material.dart';

class TeacherTimeTableScreen extends StatefulWidget {
  const TeacherTimeTableScreen({super.key});
  static String routeName = "TeacherTimeTableScreen";

  @override
  State<TeacherTimeTableScreen> createState() =>
      _TeacherTimeTableScreenScreenState();
}

class _TeacherTimeTableScreenScreenState extends State<TeacherTimeTableScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 5, vsync: this);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Time Table",
          style: jAkayaTelivigalaAppDefaultStyle,
        ),
      ),
      body: Column(
        children: [
          jheightBox,
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(jDefaultPadding * 2)),
            elevation: 10,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(jDefaultPadding * 2),
              ),
              child: TabBar(
                unselectedLabelColor: jWhiteTextColor,
                indicator: BoxDecoration(
                  color: jPrimaryColor,
                  borderRadius: BorderRadius.circular(jDefaultPadding * 2),
                ),
                controller: tabController,
                isScrollable: true,
                labelPadding: const EdgeInsets.symmetric(
                    horizontal: jDefaultPadding / 1.1),
                tabs: const [
                  Tab(child: Text('Mon', style: jTimeTableDaysTextStyle)),
                  Tab(child: Text('Tue', style: jTimeTableDaysTextStyle)),
                  Tab(child: Text('Wed', style: jTimeTableDaysTextStyle)),
                  Tab(child: Text('Thu', style: jTimeTableDaysTextStyle)),
                  Tab(child: Text('Fri', style: jTimeTableDaysTextStyle)),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(jDefaultPadding),
                  itemCount: mondayTimeTable.length,
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
                ),
                ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(jDefaultPadding),
                  itemCount: tuesdayTimeTable.length,
                  itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.only(bottom: jDefaultPadding / 2),
                    padding: const EdgeInsets.only(
                      top: jDefaultPadding / 2,
                      left: jDefaultPadding,
                      right: jDefaultPadding / 2,
                    ),
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
                          tuesdayTimeTable[index].subjectName,
                          style: jTimeTableSubjectTextStyle,
                        ),
                        StudentTimeTableCards(
                          content: tuesdayTimeTable[index].periodDuration,
                          contentStyle: jTimeTablePeriodDurationTextStyle,
                        ),
                        jTwiceThickDivider,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            StudentTimeTableCards(
                              content: tuesdayTimeTable[index].teacherName,
                              contentStyle: jTimeTableTeacherNameTextStyle,
                            ),
                            StudentTimeTableCards(
                              content: tuesdayTimeTable[index].periodNumber,
                              contentStyle: jTimeTablePeriodTextStyle,
                            ),
                          ],
                        ),
                        jHalfHeightBox,
                      ],
                    ),
                  ),
                ),
                //  For wednesday
                ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: wednesdayTimeTable.length,
                  padding: const EdgeInsets.all(jDefaultPadding),
                  itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.only(bottom: jDefaultPadding / 2),
                    padding: const EdgeInsets.only(
                      top: jDefaultPadding / 2,
                      left: jDefaultPadding,
                      right: jDefaultPadding / 2,
                    ),
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
                          wednesdayTimeTable[index].subjectName,
                          style: jTimeTableSubjectTextStyle,
                        ),
                        StudentTimeTableCards(
                          content: wednesdayTimeTable[index].periodDuration,
                          contentStyle: jTimeTablePeriodDurationTextStyle,
                        ),
                        jTwiceThickDivider,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            StudentTimeTableCards(
                              content: wednesdayTimeTable[index].teacherName,
                              contentStyle: jTimeTableTeacherNameTextStyle,
                            ),
                            StudentTimeTableCards(
                              content: wednesdayTimeTable[index].periodNumber,
                              contentStyle: jTimeTablePeriodTextStyle,
                            ),
                          ],
                        ),
                        jHalfHeightBox,
                      ],
                    ),
                  ),
                ),
                ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: thursdayTimeTable.length,
                  padding: const EdgeInsets.all(jDefaultPadding),
                  itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.only(bottom: jDefaultPadding / 2),
                    padding: const EdgeInsets.only(
                      top: jDefaultPadding / 2,
                      left: jDefaultPadding,
                      right: jDefaultPadding / 2,
                    ),
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
                          thursdayTimeTable[index].subjectName,
                          style: jTimeTableSubjectTextStyle,
                        ),
                        StudentTimeTableCards(
                          content: thursdayTimeTable[index].periodDuration,
                          contentStyle: jTimeTablePeriodDurationTextStyle,
                        ),
                        jTwiceThickDivider,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            StudentTimeTableCards(
                              content: thursdayTimeTable[index].teacherName,
                              contentStyle: jTimeTableTeacherNameTextStyle,
                            ),
                            StudentTimeTableCards(
                              content: thursdayTimeTable[index].periodNumber,
                              contentStyle: jTimeTablePeriodTextStyle,
                            ),
                          ],
                        ),
                        jHalfHeightBox,
                      ],
                    ),
                  ),
                ),
                ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(jDefaultPadding),
                  itemCount: fridayTimeTable.length,
                  itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.only(bottom: jDefaultPadding / 2),
                    padding: const EdgeInsets.only(
                      top: jDefaultPadding / 2,
                      left: jDefaultPadding,
                      right: jDefaultPadding / 2,
                    ),
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
                          fridayTimeTable[index].subjectName,
                          style: jTimeTableSubjectTextStyle,
                        ),
                        StudentTimeTableCards(
                          content: fridayTimeTable[index].periodDuration,
                          contentStyle: jTimeTablePeriodDurationTextStyle,
                        ),
                        jTwiceThickDivider,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            StudentTimeTableCards(
                              content: fridayTimeTable[index].teacherName,
                              contentStyle: jTimeTableTeacherNameTextStyle,
                            ),
                            StudentTimeTableCards(
                              content: fridayTimeTable[index].periodNumber,
                              contentStyle: jTimeTablePeriodTextStyle,
                            ),
                          ],
                        ),
                        jHalfHeightBox,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
