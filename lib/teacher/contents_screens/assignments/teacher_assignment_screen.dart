import 'package:edubrain/constants/constant.dart';
import 'package:edubrain/constants/fontstyle_constants.dart';
import 'package:edubrain/teacher/contents_screens/assignments/assignment_data/teacher_assignment_data.dart';
import 'package:edubrain/teacher/contents_screens/assignments/assignment_data/teacher_assignment_details.dart';
import 'package:edubrain/teacher/contents_screens/assignments/new_assignment/new_assignment.dart';
import 'package:flutter/material.dart';

class TeacherAssignmentsScreen extends StatelessWidget {
  const TeacherAssignmentsScreen({super.key});
  static String routeName = 'TeacherAssignmentsScreen';
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
                itemCount: teacherAssignment.length,
                // ignore: avoid_unnecessary_containers
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
                                  teacherAssignment[index].subjectName,
                                  style: jAlegrayaSansSubjectTextStyle,
                                ),
                              ),
                            ),
                            jHalfHeightBox,
                            Text(
                              teacherAssignment[index].topicName,
                              style: jAlegrayaSansContentTextStyle,
                            ),
                            jHalfHeightBox,
                            TeacherAssignmentCards(
                              detailsTitle: 'Assigned Date',
                              detailsStatusValue:
                                  teacherAssignment[index].assignedDate,
                            ),
                            jHalfHeightBox,
                            TeacherAssignmentCards(
                              detailsTitle: 'Last Date',
                              detailsStatusValue:
                                  teacherAssignment[index].dueDate,
                            ),
                            jHalfHeightBox,
                            TeacherAssignmentCards(
                              detailsTitle: 'Status',
                              detailsStatusValue:
                                  teacherAssignment[index].status,
                            ),
                            jHalfHeightBox,
                            const TeacherAssignmentSubmitButton(
                              title: 'Assignment Added',
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddAssignmentScreen.routeName);
        },
        backgroundColor: jPrimaryColor,
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
    );
  }
}
