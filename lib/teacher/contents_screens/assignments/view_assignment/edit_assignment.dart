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
                        style: jAssignmentTextStyle,
                      ),
                      SizedBox(
                        width: 150,
                        child: TextFormField(
                          controller: _editSubjectNameController,
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
                          controller: _editTopicNameController,
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
                          controller: _editAssignDateController,
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
                          controller: _editDueDateController,
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
                    controller: _editContentDetailsController,
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
    final edittedSubjectName = _editSubjectNameController.text.trim();
    final edittedTopicName = _editTopicNameController.text.trim();
    final edittedAssignDate = _editAssignDateController.text.trim();
    final edittedDueDate = _editDueDateController.text.trim();
    final edittedContents = _editContentDetailsController.text.trim();

    final assignmentEdit = AssignmentModel(
      assignmentContent: edittedContents,
      subjectName: edittedSubjectName,
      topicName: edittedTopicName,
      assignDate: edittedAssignDate,
      dueDate: edittedDueDate,
    );
    if (_editSubjectNameController.text.isEmpty ||
        _editTopicNameController.text.isEmpty ||
        _editAssignDateController.text.isEmpty ||
        _editDueDateController.text.isEmpty ||
        _editContentDetailsController.text.isEmpty) {
      return;
    } else {
      editAssignment(widget.index, assignmentEdit);

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
