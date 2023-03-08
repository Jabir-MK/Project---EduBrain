import 'package:edubrain/core/constants/constant.dart';
import 'package:edubrain/core/constants/fontstyle_constants.dart';
import 'package:edubrain/view/teacher/contents_screens/manage_student/add_student/student_details_formfield/details_formfield.dart';
import 'package:edubrain/view/teacher/contents_screens/manage_student/controller/manage_student_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddStudentScreen extends StatelessWidget {
  const AddStudentScreen({super.key});

  static String routeName = 'AddStudentScreen';

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<ManageStudentsController>(context, listen: false);
    return Scaffold(
      backgroundColor: jOtherColor,
      appBar: AppBar(
        title: const Text('Add Student'),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Container(
            color: jOtherColor,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 180,
                  decoration: const BoxDecoration(
                    color: jPrimaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(jDefaultPadding * 3.5),
                      bottomRight: Radius.circular(jDefaultPadding * 3.5),
                    ),
                  ),
                  child: Form(
                    key: provider.formKey,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircleAvatar(
                          minRadius: 80,
                          maxRadius: 80,
                          backgroundColor: jSecondaryColor,
                          backgroundImage:
                              AssetImage('assets/images/student.png'),
                        ),
                        jWidthBox,
                      ],
                    ),
                  ),
                ),
                jheightBox,
                jTwiceThickDivider,
                const Text(
                  'Basic Details',
                  style: jAlegrayaSansSubTextStyle,
                ),
                jTwiceThickDivider,
                Padding(
                  padding: const EdgeInsets.all(jDefaultPadding),
                  child: Column(
                    children: [
                      AddStudentRowFormField(
                        controller: provider.firstNameController,
                        detailHead: "First Name",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'First Name not filled';
                          } else {
                            return null;
                          }
                        },
                        labelText: 'Enter First Name',
                        inputType: TextInputType.name,
                      ),
                      jHalfHeightBox,
                      AddStudentRowFormField(
                        controller: provider.lastNameController,
                        detailHead: 'Last Name',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Last Name not filled';
                          } else {
                            return null;
                          }
                        },
                        labelText: 'Enter Last Name',
                        inputType: TextInputType.name,
                      ),
                      jHalfHeightBox,
                      AddStudentRowFormField(
                        controller: provider.regNoController,
                        detailHead: 'Register No.',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Register No. not filled';
                          } else {
                            return null;
                          }
                        },
                        labelText: 'Enter Register Number',
                        inputType: TextInputType.name,
                      ),
                      jHalfHeightBox,
                      AddStudentRowFormField(
                        controller: provider.admNoController,
                        detailHead: 'Admission No.',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Admission No. not filled';
                          } else {
                            return null;
                          }
                        },
                        labelText: 'Enter Admission Number',
                        inputType: TextInputType.number,
                      ),
                      jHalfHeightBox,
                      AddStudentRowFormField(
                        controller: provider.dOBirthController,
                        detailHead: "Date Of Birth",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Date of Birth not filled';
                          } else {
                            return null;
                          }
                        },
                        labelText: 'Enter Date of Birth',
                        inputType: TextInputType.datetime,
                      ),
                      jheightBox,
                      AddStudentRowFormField(
                        controller: provider.deptController,
                        detailHead: 'Department',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Department not filled';
                          } else {
                            return null;
                          }
                        },
                        labelText: 'Enter Department Name',
                        inputType: TextInputType.name,
                      ),
                      jheightBox,
                      AddStudentRowFormField(
                        controller: provider.nationalityController,
                        detailHead: 'Nationality',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Department not filled';
                          } else {
                            return null;
                          }
                        },
                        labelText: 'Enter Nationality',
                        inputType: TextInputType.name,
                      ),
                      jheightBox,
                      AddStudentRowFormField(
                        controller: provider.genderController,
                        detailHead: "Gender",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Department not filled';
                          } else {
                            return null;
                          }
                        },
                        labelText: "Enter Gender",
                        inputType: TextInputType.name,
                      ),
                      jheightBox,
                      jTwiceThickDivider,
                      const Text(
                        'Address Details',
                        style: jAlegrayaSansSubTextStyle,
                      ),
                      jTwiceThickDivider,
                      jheightBox,
                      AddStudentColumnFormField(
                        visibleText: false,
                        controller: provider.houseNameController,
                        detailHead: "House Name",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'House Name not filled';
                          } else {
                            return null;
                          }
                        },
                        labelText: 'Enter House Name',
                        inputType: TextInputType.name,
                      ),
                      jheightBox,
                      AddStudentColumnFormField(
                        visibleText: false,
                        controller: provider.postOfficeController,
                        detailHead: "Post Office",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Post Office not specified';
                          } else {
                            return null;
                          }
                        },
                        labelText: 'Enter Post Office',
                        inputType: TextInputType.name,
                      ),
                      jheightBox,
                      AddStudentColumnFormField(
                        visibleText: false,
                        controller: provider.placeController,
                        detailHead: "Place",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Place not specified';
                          } else {
                            return null;
                          }
                        },
                        labelText: 'Enter Place',
                        inputType: TextInputType.name,
                      ),
                      jheightBox,
                      jheightBox,
                      jTwiceThickDivider,
                      const Text(
                        'Contact Details',
                        style: jAlegrayaSansSubTextStyle,
                      ),
                      jTwiceThickDivider,
                      jheightBox,
                      AddStudentColumnFormField(
                        visibleText: false,
                        controller: provider.eMailController,
                        detailHead: 'E-Mail',
                        validator: (value) {
                          RegExp regExp = RegExp(emailPattern);
                          if (value == null || value.isEmpty) {
                            return "Please Enter Your Number/E-mail";
                          } else if (!regExp.hasMatch(value)) {
                            return "Please enter valid details";
                          }
                          return null;
                        },
                        labelText: 'Enter E-Mail',
                        inputType: TextInputType.emailAddress,
                      ),
                      jheightBox,
                      AddStudentColumnFormField(
                        controller: provider.parentNameController,
                        detailHead: 'Name of Parent/Guardian',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Name not filled';
                          } else {
                            return null;
                          }
                        },
                        labelText: "Enter Parent's / Guardian's Name",
                        inputType: TextInputType.name,
                        visibleText: false,
                      ),
                      jheightBox,
                      AddStudentColumnFormField(
                        controller: provider.mobileNumController,
                        detailHead: 'Mobile Number',
                        validator: (value) {
                          if (value!.length != 10) {
                            return 'Password must be atleast 8 characters.';
                          } else {
                            return null;
                          }
                        },
                        labelText: 'Enter Mobile Number',
                        inputType: TextInputType.phone,
                        visibleText: false,
                      ),
                      jheightBox,
                      jTwiceThickDivider,
                      const Text(
                        'Login Details',
                        style: jAlegrayaSansSubTextStyle,
                      ),
                      jTwiceThickDivider,
                      jheightBox,
                      AddStudentColumnFormField(
                        controller: provider.passController,
                        detailHead: "Password",
                        validator: (value) {
                          if (value!.length < 8) {
                            return 'Password must be atleast 8 characters.';
                          } else {
                            return null;
                          }
                        },
                        labelText: "Enter Password",
                        inputType: TextInputType.visiblePassword,
                        visibleText: true,
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (provider.formKey.currentState!.validate()) {
            provider.addStudentOnTap(context);
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
