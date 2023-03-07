import 'package:edubrain/core/constants/constant.dart';
import 'package:edubrain/core/constants/fontstyle_constants.dart';
import 'package:edubrain/view/teacher/contents_screens/assignments/controller/assignment_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddAssignmentScreen extends StatelessWidget {
  const AddAssignmentScreen({super.key});

  static String routeName = 'AddAssignmentScreen';

  @override
  Widget build(BuildContext context) {
    final addProvider = Provider.of<AssignmentProvider>(context, listen: false);
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
            padding:
                const EdgeInsets.symmetric(horizontal: jDefaultPadding / 2),
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
              key: addProvider.formKey,
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
                          controller: addProvider.subjectNameController,
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
                        style: jAssignmentTextStyle,
                      ),
                      SizedBox(
                        width: 150,
                        child: TextFormField(
                          controller: addProvider.topicNameController,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter topic name';
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
                        style: jAssignmentTextStyle,
                      ),
                      SizedBox(
                        width: 150,
                        child: TextFormField(
                          controller: addProvider.assignedDateController,
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
                        style: jAssignmentTextStyle,
                      ),
                      SizedBox(
                        width: 150,
                        child: TextFormField(
                          controller: addProvider.lastDateController,
                          keyboardType: TextInputType.datetime,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter due date to submit";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  jThriceThickDivider,
                  const Text(
                    'Content Details',
                    style: jAssignmentTextStyle,
                  ),
                  TextFormField(
                    maxLines: 11,
                    controller: addProvider.contentDetailsController,
                    keyboardType: TextInputType.multiline,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Add some contents here";
                      } else {
                        return null;
                      }
                    },
                  ),
                  jThriceThickDivider
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (addProvider.formKey.currentState!.validate()) {
            addProvider.addAssignmentOnTap(context);
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
}
