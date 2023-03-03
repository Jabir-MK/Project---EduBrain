import 'package:edubrain/constants/constant.dart';
import 'package:edubrain/constants/fontstyle_constants.dart';
import 'package:edubrain/database/functions/assignment_section.dart';
import 'package:edubrain/database/model/assignment/assignment_data_model.dart';
import 'package:edubrain/view/student/contents_screens/assignments/view_assignment.dart';
import 'package:edubrain/view/student/contents_screens/assignments/widgets/student_assignment_detail_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class StudentAssignmentsScreen extends StatefulWidget {
  const StudentAssignmentsScreen({super.key});
  static String routeName = 'StudentAssignmentsScreen';

  @override
  State<StudentAssignmentsScreen> createState() =>
      _StudentAssignmentsScreenState();
}

class _StudentAssignmentsScreenState extends State<StudentAssignmentsScreen> {
  @override
  void initState() {
    super.initState();
    getAllAssignments();
  }

  @override
  Widget build(BuildContext context) {
    double widthForAnimation = MediaQuery.of(context).size.width;
    // getAllAssignments();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Assignments',
          style: jAkayaTelivigalaAppDefaultStyle,
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: assignmentListNotifier,
        builder: (BuildContext context, List<AssignmentModel> listAssignment,
            Widget? child) {
          return AnimationLimiter(
            child: ListView.builder(
              padding: EdgeInsets.all(widthForAnimation / 40),
              physics: const BouncingScrollPhysics(),
              itemCount: listAssignment.length,
              itemBuilder: (context, index) {
                final assignmentData = listAssignment[index];
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
                                contents: assignmentData.assignmentContent,
                                index: index),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(jDefaultPadding / 2),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(jDefaultPadding),
                              margin: EdgeInsets.only(
                                  bottom: widthForAnimation / 40),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(jDefaultPadding),
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
                                      borderRadius: BorderRadius.circular(
                                          jDefaultPadding),
                                    ),
                                    child: Center(
                                      child: Text(
                                        listAssignment[index].subjectName,
                                        style: jAlegrayaSansSubjectTextStyle,
                                      ),
                                    ),
                                  ),
                                  jHalfHeightBox,
                                  Text(
                                    listAssignment[index].topicName,
                                    style: jAlegrayaSansContentTextStyle,
                                  ),
                                  jHalfHeightBox,
                                  StudentAssignmentCards(
                                    detailsTitle: 'Assigned Date',
                                    detailsStatusValue:
                                        listAssignment[index].assignDate,
                                  ),
                                  jHalfHeightBox,
                                  StudentAssignmentCards(
                                    detailsTitle: 'Last Date',
                                    detailsStatusValue:
                                        listAssignment[index].dueDate,
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
