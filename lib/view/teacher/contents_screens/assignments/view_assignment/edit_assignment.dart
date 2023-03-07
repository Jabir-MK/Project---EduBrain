import 'dart:developer';

import 'package:edubrain/core/constants/constant.dart';
import 'package:edubrain/core/constants/fontstyle_constants.dart';
import 'package:edubrain/view/teacher/contents_screens/assignments/controller/assignment_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditAssignmentScreen extends StatelessWidget {
  const EditAssignmentScreen({
    super.key,
    required this.editSubjectName,
    required this.editTopicName,
    required this.editAssignedDate,
    required this.editDueDate,
    required this.editContent,
    required this.index,
  });

  static String routeName = 'EditAssignmentScreen';

  final String editSubjectName;
  final String editTopicName;
  final String editAssignedDate;
  final String editDueDate;
  final String editContent;

  final int index;

  @override
  Widget build(BuildContext context) {
    final assignmentProvider =
        Provider.of<AssignmentProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // Having Some doubts regarding the value to show on the editing textfields
      assignmentProvider.editSubjectNameController =
          TextEditingController(text: editSubjectName);
      assignmentProvider.editTopicNameController =
          TextEditingController(text: editTopicName);
      assignmentProvider.editAssignDateController =
          TextEditingController(text: editAssignedDate);
      assignmentProvider.editDueDateController =
          TextEditingController(text: editDueDate);
      assignmentProvider.editContentDetailsController =
          TextEditingController(text: editContent);
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Assignment',
          style: jAkayaTelivigalaAppDefaultStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(jDefaultPadding / 2),
          child: Container(
            padding: const EdgeInsets.all(jDefaultPadding / 2),
            width: double.infinity,
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
            child: Form(
              key: assignmentProvider.formKey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Subject',
                        style: jAssignmentTextStyle,
                      ),
                      SizedBox(
                        width: 150,
                        child: TextFormField(
                          controller:
                              assignmentProvider.editSubjectNameController,
                          keyboardType: TextInputType.name,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Topic',
                        style: jAssignmentTextStyle,
                      ),
                      SizedBox(
                        width: 150,
                        child: TextFormField(
                          controller:
                              assignmentProvider.editTopicNameController,
                          keyboardType: TextInputType.name,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Assigned Date',
                        style: jAssignmentTextStyle,
                      ),
                      SizedBox(
                        width: 150,
                        child: TextFormField(
                          controller:
                              assignmentProvider.editAssignDateController,
                          keyboardType: TextInputType.datetime,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Last Date',
                        style: jAssignmentTextStyle,
                      ),
                      SizedBox(
                        width: 150,
                        child: TextFormField(
                          controller: assignmentProvider.editDueDateController,
                          keyboardType: TextInputType.datetime,
                        ),
                      ),
                    ],
                  ),
                  jheightBox,
                  jThriceThickDivider,
                  const Text(
                    'Content Details',
                    style: jTimeTableSubjectTextStyle,
                  ),
                  TextFormField(
                    controller: assignmentProvider.editContentDetailsController,
                    keyboardType: TextInputType.multiline,
                    maxLines: 15,
                  ),
                  jheightBox,
                  jThriceThickDivider
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (assignmentProvider.formKey.currentState!.validate()) {
            assignmentProvider.editAssignmentOnTap(context, index);
            log('Edit done');
            Navigator.of(context).pop();
          } else {
            log('Edit not done');
          }
        },
        backgroundColor: jPrimaryColor,
        child: const Icon(
          Icons.check,
          size: 45,
        ),
      ),
    );
  }
}
