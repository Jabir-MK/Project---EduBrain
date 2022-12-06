import 'package:edubrain/constants/constant.dart';
import 'package:edubrain/constants/fontstyle_constants.dart';
import 'package:edubrain/database/functions/db_functions.dart';
import 'package:edubrain/database/model/assignment/assignment_data_model.dart';
import 'package:flutter/material.dart';

class AddAssignmentScreen extends StatefulWidget {
  const AddAssignmentScreen({super.key});

  static String routeName = 'AddAssignmentScreen';

  @override
  State<AddAssignmentScreen> createState() => _AddAssignmentScreenState();
}

class _AddAssignmentScreenState extends State<AddAssignmentScreen> {
  final TextEditingController _subjectNameController = TextEditingController();
  final TextEditingController _topicNameController = TextEditingController();
  final TextEditingController _assignedDateController = TextEditingController();
  final TextEditingController _lastDateController = TextEditingController();
  final TextEditingController _contentDetailsController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Assignment',
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
                        width: 180,
                        child: TextFormField(
                          controller: _subjectNameController,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter the name of subject';
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
                        width: 180,
                        child: TextFormField(
                          controller: _topicNameController,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter topic for the assignment';
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
                        width: 180,
                        child: TextFormField(
                          controller: _assignedDateController,
                          keyboardType: TextInputType.datetime,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter the assigned date";
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
                        width: 180,
                        child: TextFormField(
                          controller: _lastDateController,
                          keyboardType: TextInputType.datetime,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter the last date to submit";
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
                    maxLines: 16,
                    controller: _contentDetailsController,
                    keyboardType: TextInputType.multiline,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Add some contents here";
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
            addAssignmentOnTap();
          } else {
            return;
          }
        },
        backgroundColor: jPrimaryColor,
        child: const Icon(
          Icons.check,
          size: 35,
        ),
      ),
    );
  }

  Future<void> addAssignmentOnTap() async {
    final subjectName = _subjectNameController.text.trim();
    final topicName = _topicNameController.text.trim();
    final assignedDate = _assignedDateController.text.trim();
    final lastDate = _lastDateController.text.trim();
    final contentDetails = _contentDetailsController.text.trim();
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
    addAssignment(assignment);
    Navigator.of(context).pop();
  }
}
