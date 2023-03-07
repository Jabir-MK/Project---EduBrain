import 'package:edubrain/core/constants/constant.dart';
import 'package:edubrain/core/constants/fontstyle_constants.dart';
import 'package:edubrain/view/teacher/contents_screens/assignments/widgets/view_assignment_text_row.dart';
import 'package:flutter/material.dart';

class ViewAssignmentScreen extends StatelessWidget {
  const ViewAssignmentScreen({
    super.key,
    required this.subjectName,
    required this.topicName,
    required this.assignedDate,
    required this.dueDate,
    required this.contentDetails,
    required this.index,
  });

  static String routeName = 'ViewAssignmentScreen';

  final String subjectName;
  final String topicName;
  final String assignedDate;
  final String dueDate;
  final String contentDetails;

  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(jDefaultPadding / 2),
          child: Container(
            padding: const EdgeInsets.all(jDefaultPadding / 2),
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: jSecondaryColor,
              borderRadius: BorderRadius.circular(jDefaultPadding),
              boxShadow: const [
                BoxShadow(
                  color: jWhiteTextColor,
                  blurRadius: 5,
                  offset: Offset(5, 5),
                )
              ],
            ),
            child: Column(
              children: [
                ViewAssignmentTextRow(
                  detailHead: 'Subject',
                  detailValue: subjectName,
                ),
                ViewAssignmentTextRow(
                  detailHead: 'Topic',
                  detailValue: topicName,
                ),
                ViewAssignmentTextRow(
                  detailHead: 'Assigned Date',
                  detailValue: assignedDate,
                ),
                ViewAssignmentTextRow(
                  detailHead: 'Last Date',
                  detailValue: dueDate,
                ),
                jDefaultDivider,
                const Text(
                  'Content Details',
                  style: jTimeTableSubjectTextStyle,
                ),
                Text(contentDetails),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
