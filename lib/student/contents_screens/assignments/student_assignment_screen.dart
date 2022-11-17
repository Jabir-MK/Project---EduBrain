import 'package:edubrain/constants/constant.dart';
import 'package:edubrain/constants/fontstyle_constants.dart';
import 'package:edubrain/student/contents_screens/assignments/assignment_data/student_assignment_data.dart';
import 'package:edubrain/student/contents_screens/assignments/assignment_data/student_assignment_detail_card.dart';
import 'package:flutter/material.dart';

class StudentAssignmentsScreen extends StatelessWidget {
  const StudentAssignmentsScreen({super.key});
  static String routeName = 'AssignmentsScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Assignments',
          style: jAkayaTelivigalaAppDefaultStyle,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: jOtherColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(jDefaultPadding),
                  topRight: Radius.circular(jDefaultPadding),
                ),
              ),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(jDefaultPadding),
                itemCount: assignment.length,
                itemBuilder: (context, int index) => Container(
                  margin: const EdgeInsets.only(bottom: jDefaultPadding),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(jDefaultPadding),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(jDefaultPadding),
                          color: jOtherColor,
                          boxShadow: const [
                            BoxShadow(
                              color: jLightTextColor,
                              blurRadius: 2.0,
                            )
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 150,
                              height: 40,
                              decoration: BoxDecoration(
                                color: jSecondaryColor.withOpacity(0.4),
                                borderRadius:
                                    BorderRadius.circular(jDefaultPadding),
                              ),
                              child: Center(
                                child: Text(
                                  assignment[index].subjectName,
                                  style: jAlegrayaSansSubjectTextStyle,
                                ),
                              ),
                            ),
                            jHalfHeightBox,
                            Text(
                              assignment[index].topicName,
                              style: jAlegrayaSansContentTextStyle,
                            ),
                            jHalfHeightBox,
                            StudentAssignmentCards(
                              detailsTitle: 'Assigned Date',
                              detailsStatusValue:
                                  assignment[index].assignedDate,
                            ),
                            jHalfHeightBox,
                            StudentAssignmentCards(
                              detailsTitle: 'Last Date',
                              detailsStatusValue: assignment[index].dueDate,
                            ),
                            jHalfHeightBox,
                            StudentAssignmentCards(
                              detailsTitle: 'Status',
                              detailsStatusValue: assignment[index].status,
                            ),
                            jHalfHeightBox,
                            if (assignment[index].status == 'Pending')
                              StudentAssignmentSubmitButton(
                                onPress: () {},
                                title: 'To Submit',
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
