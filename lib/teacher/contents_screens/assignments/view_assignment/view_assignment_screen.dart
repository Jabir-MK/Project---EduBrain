import 'dart:developer';

import 'package:edubrain/constants/constant.dart';
import 'package:edubrain/constants/fontstyle_constants.dart';
import 'package:edubrain/teacher/contents_screens/assignments/view_assignment/view_assignment_text_row.dart';
import 'package:flutter/material.dart';

class ViewAssignmentScreen extends StatefulWidget {
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
  State<ViewAssignmentScreen> createState() => _ViewAssignmentScreenState();
}

class _ViewAssignmentScreenState extends State<ViewAssignmentScreen> {
  late String subjectName;
  late String topicName;
  late String assignedDate;
  late String dueDate;
  late String contents;

  @override
  void initState() {
    super.initState();
    subjectName = TextEditingController(text: widget.subjectName).text;
    topicName = TextEditingController(text: widget.topicName).text;
    assignedDate = TextEditingController(text: widget.assignedDate).text;
    dueDate = TextEditingController(text: widget.dueDate).text;
    contents = TextEditingController(text: widget.contentDetails).text;
    log(subjectName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Text(contents),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
