import 'package:edubrain/core/constants/constant.dart';
import 'package:edubrain/core/constants/fontstyle_constants.dart';
import 'package:edubrain/database/functions/assignment_section.dart';
import 'package:edubrain/view/student/contents_screens/assignments/view_assignment.dart';
import 'package:edubrain/view/student/contents_screens/assignments/widgets/student_assignment_detail_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

class StudentAssignmentsScreen extends StatelessWidget {
  const StudentAssignmentsScreen({super.key});
  static String routeName = 'StudentAssignmentsScreen';

  @override
  Widget build(BuildContext context) {
    double widthForAnimation = MediaQuery.of(context).size.width;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<AssignmentsDBProvider>(context, listen: false)
          .getAllAssignments();
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Assignments',
          style: jAkayaTelivigalaAppDefaultStyle,
        ),
      ),
      body: Consumer<AssignmentsDBProvider>(
        builder: (context, value, child) {
          return value.assignmentList.isEmpty
              ? const Center(
                  child: Text(
                    'No Assignments available',
                    style: TextStyle(
                      fontSize: 20,
                      color: jWhiteTextColor,
                    ),
                  ),
                )
              : AnimationLimiter(
                  child: ListView.builder(
                    padding: EdgeInsets.all(widthForAnimation / 40),
                    physics: const BouncingScrollPhysics(),
                    itemCount: value.assignmentList.length,
                    itemBuilder: (context, index) {
                      final assignmentData = value.assignmentList[index];
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        delay: const Duration(milliseconds: 100),
                        child: SlideAnimation(
                          duration: const Duration(milliseconds: 2500),
                          curve: Curves.fastLinearToSlowEaseIn,
                          horizontalOffset: -300,
                          verticalOffset: -850,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => StudentViewAssignment(
                                      subject: assignmentData.subjectName,
                                      topic: assignmentData.topicName,
                                      assignDate: assignmentData.assignDate,
                                      lastDate: assignmentData.dueDate,
                                      contents:
                                          assignmentData.assignmentContent,
                                      index: index),
                                ),
                              );
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.all(jDefaultPadding / 2),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding:
                                        const EdgeInsets.all(jDefaultPadding),
                                    margin: EdgeInsets.only(
                                        bottom: widthForAnimation / 40),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          jDefaultPadding),
                                      color: jOtherColor,
                                      boxShadow: const [
                                        BoxShadow(
                                          color: jLightTextColor,
                                          blurRadius: 2.0,
                                        )
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 150,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: jSecondaryColor
                                                .withOpacity(0.4),
                                            borderRadius: BorderRadius.circular(
                                                jDefaultPadding),
                                          ),
                                          child: Center(
                                            child: Text(
                                              assignmentData.subjectName,
                                              style:
                                                  jAlegrayaSansSubjectTextStyle,
                                            ),
                                          ),
                                        ),
                                        jHalfHeightBox,
                                        Text(
                                          assignmentData.topicName,
                                          style: jAlegrayaSansContentTextStyle,
                                        ),
                                        jHalfHeightBox,
                                        StudentAssignmentCards(
                                          detailsTitle: 'Assigned Date',
                                          detailsStatusValue:
                                              assignmentData.assignDate,
                                        ),
                                        jHalfHeightBox,
                                        StudentAssignmentCards(
                                          detailsTitle: 'Last Date',
                                          detailsStatusValue:
                                              assignmentData.dueDate,
                                        ),
                                        jHalfHeightBox,
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
        },
      ),
    );
  }
}
