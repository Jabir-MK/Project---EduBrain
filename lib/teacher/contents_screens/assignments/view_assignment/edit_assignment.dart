import 'package:edubrain/constants/constant.dart';
import 'package:edubrain/constants/fontstyle_constants.dart';
import 'package:edubrain/database/functions/db_functions.dart';
import 'package:edubrain/database/model/assignment/assignment_data_model.dart';
import 'package:flutter/material.dart';

class EditAssignmentScreen extends StatefulWidget {
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
  State<EditAssignmentScreen> createState() => _EditAssignmentScreenState();
}

class _EditAssignmentScreenState extends State<EditAssignmentScreen> {
  TextEditingController _editSubjectNameController = TextEditingController();
  TextEditingController _editTopicNameController = TextEditingController();
  TextEditingController _editAssignDateController = TextEditingController();
  TextEditingController _editDueDateController = TextEditingController();
  TextEditingController _editContentDetailsController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _editSubjectNameController =
        TextEditingController(text: widget.editSubjectName);
    _editTopicNameController =
        TextEditingController(text: widget.editTopicName);
    _editAssignDateController =
        TextEditingController(text: widget.editAssignedDate);
    _editDueDateController = TextEditingController(text: widget.editDueDate);
    _editContentDetailsController =
        TextEditingController(text: widget.editContent);
  }

  @override
  Widget build(BuildContext context) {
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
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Subject',
                        style: jTimeTableSubjectTextStyle,
                      ),
                      SizedBox(
                        width: 200,
                        child: TextFormField(
                          controller: _editSubjectNameController,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter subject name';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Topic',
                        style: jTimeTableSubjectTextStyle,
                      ),
                      SizedBox(
                        width: 200,
                        child: TextFormField(
                          controller: _editTopicNameController,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter a Topic for assignment';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Assigned Date',
                        style: jTimeTableSubjectTextStyle,
                      ),
                      SizedBox(
                        width: 200,
                        child: TextFormField(
                          controller: _editAssignDateController,
                          keyboardType: TextInputType.datetime,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter assigned date for the assignment';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Last Date',
                        style: jTimeTableSubjectTextStyle,
                      ),
                      SizedBox(
                        width: 200,
                        child: TextFormField(
                          controller: _editDueDateController,
                          keyboardType: TextInputType.datetime,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter Due date for assignment';
                            } else {
                              return null;
                            }
                          },
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
                    controller: _editContentDetailsController,
                    keyboardType: TextInputType.multiline,
                    maxLines: 15,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Add some contents';
                      } else {
                        return null;
                      }
                    },
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
          if (_formKey.currentState!.validate()) {
            editAssignmentOnTap(context);
            Navigator.of(context).pop();
          } else {}
        },
        backgroundColor: jPrimaryColor,
        child: const Icon(
          Icons.check,
          size: 45,
        ),
      ),
    );
  }

  Future<void> editAssignmentOnTap(context) async {
    final assignmentEdit = AssignmentModel(
      assignmentContent: _editContentDetailsController.text,
      subjectName: _editSubjectNameController.text,
      topicName: _editTopicNameController.text,
      assignDate: _editAssignDateController.text,
      dueDate: _editDueDateController.text,
    );
    editAssignment(widget.index, assignmentEdit);
    if (_editSubjectNameController.text.isEmpty ||
        _editTopicNameController.text.isEmpty ||
        _editAssignDateController.text.isEmpty ||
        _editDueDateController.text.isEmpty ||
        _editContentDetailsController.text.isEmpty) {
      return;
    } else {
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
