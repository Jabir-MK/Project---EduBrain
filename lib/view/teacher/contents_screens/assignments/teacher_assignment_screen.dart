import 'package:edubrain/core/constants/constant.dart';
import 'package:edubrain/core/constants/fontstyle_constants.dart';
import 'package:edubrain/database/functions/assignment_section.dart';
import 'package:edubrain/view/teacher/contents_screens/assignments/view_assignment/edit_assignment.dart';
import 'package:edubrain/view/teacher/contents_screens/assignments/view_assignment/view_assignment_screen.dart';
import 'package:edubrain/view/teacher/contents_screens/assignments/widgets/new_assignment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:edubrain/view/teacher/contents_screens/assignments/widgets/teacher_assignment_details.dart';
import 'package:provider/provider.dart';

class TeacherAssignmentsScreen extends StatelessWidget {
  const TeacherAssignmentsScreen({super.key});
  static String routeName = 'TeacherAssignmentsScreen';

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
                    'No Assignments ',
                    style: TextStyle(
                      color: jWhiteTextColor,
                      fontSize: 20,
                    ),
                  ),
                )
              : AnimationLimiter(
                  child: ListView.builder(
                    padding: EdgeInsets.all(widthForAnimation / 20),
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
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ViewAssignmentScreen(
                                  subjectName: assignmentData.subjectName,
                                  topicName: assignmentData.topicName,
                                  assignedDate: assignmentData.assignDate,
                                  dueDate: assignmentData.dueDate,
                                  contentDetails:
                                      assignmentData.assignmentContent,
                                  index: index,
                                ),
                              ));
                            },
                            child: Container(
                              padding:
                                  const EdgeInsets.all(jDefaultPadding / 1.5),
                              margin: EdgeInsets.only(
                                  bottom: widthForAnimation / 20),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(jDefaultPadding),
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
                                      borderRadius: BorderRadius.circular(
                                          jDefaultPadding),
                                    ),
                                    child: Center(
                                      child: Text(
                                        assignmentData.subjectName,
                                        style: jAlegrayaSansSubjectTextStyle,
                                      ),
                                    ),
                                  ),
                                  jDefaultDivider,
                                  Text(
                                    assignmentData.topicName,
                                    style: jAlegrayaSansContentTextStyle,
                                  ),
                                  jHalfHeightBox,
                                  TeacherAssignmentCards(
                                      detailsTitle: 'Assigned Date',
                                      detailsStatusValue:
                                          assignmentData.assignDate),
                                  jHalfHeightBox,
                                  TeacherAssignmentCards(
                                    detailsTitle: 'Last Date',
                                    detailsStatusValue: assignmentData.dueDate,
                                  ),
                                  jDefaultDivider,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ElevatedButton.icon(
                                        onPressed: () {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) =>
                                                EditAssignmentScreen(
                                                    editSubjectName:
                                                        assignmentData
                                                            .subjectName,
                                                    editTopicName: assignmentData
                                                        .topicName,
                                                    editAssignedDate:
                                                        assignmentData
                                                            .assignDate,
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
                                          elevation:
                                              MaterialStateProperty.all(15),
                                          textStyle: MaterialStateProperty.all(
                                              jEditButtonWhiteTextStyle),
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  jPrimaryColor),
                                        ),
                                      ),
                                      ElevatedButton.icon(
                                        onPressed: () {
                                          value.deleteAssignment(index);
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          size: 15,
                                        ),
                                        label: const Text('Delete'),
                                        style: ButtonStyle(
                                          elevation:
                                              MaterialStateProperty.all(15),
                                          textStyle: MaterialStateProperty.all(
                                              jEditButtonWhiteTextStyle),
                                          backgroundColor:
                                              MaterialStateProperty.all(
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
