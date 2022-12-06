import 'package:edubrain/constants/constant.dart';
import 'package:edubrain/constants/fontstyle_constants.dart';
import 'package:edubrain/student/contents_screens/time_table/timetable_data/student_timetable_data.dart';
import 'package:edubrain/student/contents_screens/time_table/timetable_data/student_timetable_details_card.dart';
import 'package:flutter/material.dart';

class StudentTimeTableScreen extends StatefulWidget {
  const StudentTimeTableScreen({super.key});
  static String routeName = "StudentTimeTableScreen";

  @override
  State<StudentTimeTableScreen> createState() => _StudentTimeTableScreenState();
}

class _StudentTimeTableScreenState extends State<StudentTimeTableScreen>
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
                    horizontal: jDefaultPadding * 1.2),
                tabs: const [
                  Tab(child: Text('Tue', style: jTimeTableDaysTextStyle)),
                  Tab(child: Text('Mon', style: jTimeTableDaysTextStyle)),
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
                    margin: const EdgeInsets.only(bottom: jDefaultPadding),
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
                        jHalfHeightBox,
                        StudentTimeTableCards(
                          content: mondayTimeTable[index].periodDuration,
                          contentStyle: jTimeTablePeriodDurationTextStyle,
                        ),
                        jHalfHeightBox,
                        const Divider(
                          thickness: 2,
                          color: jLightTextColor,
                          indent: 2,
                          endIndent: 2,
                        ),
                        jHalfHeightBox,
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
                    margin: const EdgeInsets.only(bottom: jDefaultPadding),
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
                        jHalfHeightBox,
                        StudentTimeTableCards(
                          content: tuesdayTimeTable[index].periodDuration,
                          contentStyle: jTimeTablePeriodDurationTextStyle,
                        ),
                        jHalfHeightBox,
                        const Divider(
                          thickness: 2,
                          color: jLightTextColor,
                          indent: 2,
                          endIndent: 2,
                        ),
                        jHalfHeightBox,
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
                    margin: const EdgeInsets.only(bottom: jDefaultPadding),
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
                        jHalfHeightBox,
                        StudentTimeTableCards(
                          content: wednesdayTimeTable[index].periodDuration,
                          contentStyle: jTimeTablePeriodDurationTextStyle,
                        ),
                        jHalfHeightBox,
                        const Divider(
                          thickness: 2,
                          color: jLightTextColor,
                          indent: 2,
                          endIndent: 2,
                        ),
                        jHalfHeightBox,
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
                    margin: const EdgeInsets.only(bottom: jDefaultPadding),
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
                        jHalfHeightBox,
                        StudentTimeTableCards(
                          content: thursdayTimeTable[index].periodDuration,
                          contentStyle: jTimeTablePeriodDurationTextStyle,
                        ),
                        jHalfHeightBox,
                        const Divider(
                          thickness: 2,
                          color: jLightTextColor,
                          indent: 2,
                          endIndent: 2,
                        ),
                        jHalfHeightBox,
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
                    margin: const EdgeInsets.only(bottom: jDefaultPadding),
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
                        jHalfHeightBox,
                        StudentTimeTableCards(
                          content: fridayTimeTable[index].periodDuration,
                          contentStyle: jTimeTablePeriodDurationTextStyle,
                        ),
                        jHalfHeightBox,
                        const Divider(
                          thickness: 2,
                          color: jLightTextColor,
                          indent: 2,
                          endIndent: 2,
                        ),
                        jHalfHeightBox,
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
