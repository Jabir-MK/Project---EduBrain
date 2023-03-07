import 'package:edubrain/core/constants/constant.dart';
import 'package:edubrain/database/functions/assignment_section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../database/model/assignment/assignment_data_model.dart';

class AssignmentProvider with ChangeNotifier {
  /* Assignment Add Details
      This details below are for the feature of adding the assignments
  */
  final TextEditingController subjectNameController = TextEditingController();
  final TextEditingController topicNameController = TextEditingController();
  final TextEditingController assignedDateController = TextEditingController();
  final TextEditingController lastDateController = TextEditingController();
  final TextEditingController contentDetailsController =
      TextEditingController();

  // final formKey = GlobalKey<FormState>();

  Future<void> addAssignmentOnTap(context) async {
    final subjectName = subjectNameController.text.trim();
    final topicName = topicNameController.text.trim();
    final assignedDate = assignedDateController.text.trim();
    final lastDate = lastDateController.text.trim();
    final contentDetails = contentDetailsController.text.trim();
    if (subjectName.isEmpty ||
        topicName.isEmpty ||
        assignedDate.isEmpty ||
        lastDate.isEmpty ||
        contentDetails.isEmpty) {
      return;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: jSecondaryColor,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(jDefaultPadding),
          content: Text('Assignment Added Successfully'),
        ),
      );
    }
    final assignment = AssignmentModel(
      assignmentContent: contentDetails,
      subjectName: subjectName,
      topicName: topicName,
      assignDate: assignedDate,
      dueDate: lastDate,
    );
    Provider.of<AssignmentsDBProvider>(context, listen: false)
        .addAssignment(assignment);
    Navigator.of(context).pop();
  }

  /* Assignment Edit Details
      This details below are for the feature of Editing the assignments 
      that are already added 
  */
  TextEditingController editSubjectNameController = TextEditingController();
  TextEditingController editTopicNameController = TextEditingController();
  TextEditingController editAssignDateController = TextEditingController();
  TextEditingController editDueDateController = TextEditingController();
  TextEditingController editContentDetailsController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  Future<void> editAssignmentOnTap(context, index) async {
    final edittedSubjectName = editSubjectNameController.text.trim();
    final edittedTopicName = editTopicNameController.text.trim();
    final edittedAssignDate = editAssignDateController.text.trim();
    final edittedDueDate = editDueDateController.text.trim();
    final edittedContents = editContentDetailsController.text.trim();

    final assignmentEdit = AssignmentModel(
      assignmentContent: edittedContents,
      subjectName: edittedSubjectName,
      topicName: edittedTopicName,
      assignDate: edittedAssignDate,
      dueDate: edittedDueDate,
    );
    if (editSubjectNameController.text.isEmpty ||
        editTopicNameController.text.isEmpty ||
        editAssignDateController.text.isEmpty ||
        editDueDateController.text.isEmpty ||
        editContentDetailsController.text.isEmpty) {
      return;
    } else {
      Provider.of<AssignmentsDBProvider>(context, listen: false)
          .editAssignment(index, assignmentEdit);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: jSecondaryColor,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(jDefaultPadding),
          content: Text("Updated Assignment Successfully"),
        ),
      );
    }
  }
}
