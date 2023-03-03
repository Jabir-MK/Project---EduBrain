import 'package:edubrain/core/constants/constant.dart';
import 'package:edubrain/core/constants/fontstyle_constants.dart';
import 'package:edubrain/database/functions/assignment_section.dart';
import 'package:edubrain/database/model/assignment/assignment_data_model.dart';
import 'package:edubrain/view/teacher/contents_screens/assignments/view_assignment/edit_assignment.dart';
import 'package:edubrain/view/teacher/contents_screens/assignments/view_assignment/view_assignment_screen.dart';
import 'package:edubrain/view/teacher/contents_screens/assignments/widgets/new_assignment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:edubrain/view/teacher/contents_screens/assignments/widgets/teacher_assignment_details.dart';

class TeacherAssignmentsScreen extends StatefulWidget {
  const TeacherAssignmentsScreen({super.key});
  static String routeName = 'TeacherAssignmentsScreen';

  @override
  State<TeacherAssignmentsScreen> createState() =>
      _TeacherAssignmentsScreenState();
}

class _TeacherAssignmentsScreenState extends State<TeacherAssignmentsScreen> {
  @override
  void initState() {
    super.initState();
    getAllAssignments();
  }

  @override
  Widget build(BuildContext context) {
    double widthForAnimation = MediaQuery.of(context).size.width;

    getAllAssignments();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Assignments',
          style: jAkayaTelivigalaAppDefaultStyle,
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: assignmentListNotifier,
        builder: (BuildContext context, List<AssignmentModel> assignmentList,
            Widget? child) {
          return AnimationLimiter(
            child: ListView.builder(
              padding: EdgeInsets.all(widthForAnimation / 20),
              physics: const BouncingScrollPhysics(),
              itemCount: assignmentList.length,
              itemBuilder: (context, index) {
                final assignmentData = assignmentList[index];
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
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ViewAssignmentScreen(
                            subjectName: assignmentData.subjectName,
                            topicName: assignmentData.topicName,
                            assignedDate: assignmentData.assignDate,
                            dueDate: assignmentData.dueDate,
                            contentDetails: assignmentData.assignmentContent,
                            index: index,
                          ),
                        ));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(jDefaultPadding / 1.5),
                        margin: EdgeInsets.only(bottom: widthForAnimation / 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(jDefaultPadding),
                          color: jOtherColor,
                          boxShadow: const [
                            BoxShadow(
                              color: jSecondaryColor,
                              blurRadius: 5,
                              offset: Offset(5, 10),
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
                                  assignmentList[index].subjectName,
                                  style: jAlegrayaSansSubjectTextStyle,
                                ),
                              ),
                            ),
                            jDefaultDivider,
                            Text(
                              assignmentList[index].topicName,
                              style: jAlegrayaSansContentTextStyle,
                            ),
                            jHalfHeightBox,
                            TeacherAssignmentCards(
                                detailsTitle: 'Assigned Date',
                                detailsStatusValue:
                                    assignmentList[index].assignDate),
                            jHalfHeightBox,
                            TeacherAssignmentCards(
                              detailsTitle: 'Last Date',
                              detailsStatusValue: assignmentList[index].dueDate,
                            ),
                            jDefaultDivider,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton.icon(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) =>
                                          EditAssignmentScreen(
                                              editSubjectName:
                                                  assignmentData.subjectName,
                                              editTopicName:
                                                  assignmentData.topicName,
                                              editAssignedDate:
                                                  assignmentData.assignDate,
                                              editDueDate:
                                                  assignmentData.dueDate,
                                              editContent: assignmentData
                                                  .assignmentContent,
                                              index: index),
                                    ));
                                  },
                                  icon: const Icon(
                                    Icons.edit,
                                    size: 15,
                                  ),
                                  label: const Text('Edit'),
                                  style: ButtonStyle(
                                    elevation: MaterialStateProperty.all(15),
                                    textStyle: MaterialStateProperty.all(
                                        jEditButtonWhiteTextStyle),
                                    backgroundColor: MaterialStateProperty.all(
                                        jPrimaryColor),
                                  ),
                                ),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    deleteAssignment(index);
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    size: 15,
                                  ),
                                  label: const Text('Delete'),
                                  style: ButtonStyle(
                                    elevation: MaterialStateProperty.all(15),
                                    textStyle: MaterialStateProperty.all(
                                        jEditButtonWhiteTextStyle),
                                    backgroundColor: MaterialStateProperty.all(
                                        jPrimaryColor),
                                  ),
                                )
                              ],
                            )
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddAssignmentScreen.routeName);
        },
        backgroundColor: jSecondaryColor,
        elevation: 10,
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
    );
  }
}
