import 'package:edubrain/constants/constant.dart';
import 'package:edubrain/constants/fontstyle_constants.dart';
import 'package:edubrain/database/functions/db_functions.dart';
import 'package:edubrain/database/model/assignment/assignment_data_model.dart';
import 'package:edubrain/teacher/contents_screens/assignments/assignment_data/teacher_assignment_details.dart';
import 'package:edubrain/teacher/contents_screens/assignments/new_assignment/new_assignment.dart';
import 'package:edubrain/teacher/contents_screens/assignments/view_assignment/edit_assignment.dart';
import 'package:edubrain/teacher/contents_screens/assignments/view_assignment/view_assignment_screen.dart';
import 'package:flutter/material.dart';

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
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: assignmentList.length,
            itemBuilder: (context, index) {
              final assignmentData = assignmentList[index];
              return GestureDetector(
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
                child: Padding(
                  padding: const EdgeInsets.all(jDefaultPadding / 2),
                  child: Container(
                    padding: const EdgeInsets.all(jDefaultPadding / 1.5),
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
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => EditAssignmentScreen(
                                      editSubjectName:
                                          assignmentData.subjectName,
                                      editTopicName: assignmentData.topicName,
                                      editAssignedDate:
                                          assignmentData.assignDate,
                                      editDueDate: assignmentData.dueDate,
                                      editContent:
                                          assignmentData.assignmentContent,
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
                                backgroundColor:
                                    MaterialStateProperty.all(jPrimaryColor),
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
                                backgroundColor:
                                    MaterialStateProperty.all(jPrimaryColor),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
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
