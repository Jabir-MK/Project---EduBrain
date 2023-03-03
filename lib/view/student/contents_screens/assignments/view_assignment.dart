import 'package:edubrain/core/constants/constant.dart';
import 'package:edubrain/core/constants/fontstyle_constants.dart';
import 'package:edubrain/view/student/contents_screens/assignments/widgets/view_assignment_row.dart';
import 'package:flutter/material.dart';

class StudentViewAssignment extends StatefulWidget {
  const StudentViewAssignment({
    super.key,
    required this.subject,
    required this.topic,
    required this.assignDate,
    required this.lastDate,
    required this.contents,
    required this.index,
  });
  static String routeName = 'StudentViewAssignmentScreen';

  final String subject;
  final String topic;
  final String assignDate;
  final String lastDate;
  final String contents;

  final int index;

  @override
  State<StudentViewAssignment> createState() => _StudentViewAssignmentState();
}

class _StudentViewAssignmentState extends State<StudentViewAssignment> {
  late String subjectName;
  late String topicName;
  late String assignedDate;
  late String dueDate;
  late String contentDetails;
  @override
  void initState() {
    subjectName = TextEditingController(text: widget.subject).text;
    topicName = TextEditingController(text: widget.topic).text;
    assignedDate = TextEditingController(text: widget.assignDate).text;
    dueDate = TextEditingController(text: widget.lastDate).text;
    contentDetails = TextEditingController(text: widget.contents).text;

    super.initState();
  }

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
                StudentViewAssignmentRow(
                  detailTitle: 'Subject',
                  detailValue: subjectName,
                ),
                StudentViewAssignmentRow(
                  detailTitle: 'Topic',
                  detailValue: topicName,
                ),
                StudentViewAssignmentRow(
                  detailTitle: 'Assigned Date',
                  detailValue: assignedDate,
                ),
                StudentViewAssignmentRow(
                  detailTitle: 'Last Date',
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
