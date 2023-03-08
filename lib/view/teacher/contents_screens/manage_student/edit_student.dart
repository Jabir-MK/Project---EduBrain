import 'package:edubrain/core/constants/constant.dart';
import 'package:edubrain/core/constants/fontstyle_constants.dart';
import 'package:edubrain/database/model/student/student_data_model.dart';
import 'package:edubrain/view/teacher/contents_screens/manage_student/controller/manage_student_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditStudentScreen extends StatelessWidget {
  const EditStudentScreen({
    super.key,
    required this.index,
    required this.student,
  });

  final int index;
  final StudentModel student;

  static String routeName = 'EditStudentScreen';

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<ManageStudentsController>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      provider.editFirstNameController =
          TextEditingController(text: student.fName);
      provider.editLastNameController =
          TextEditingController(text: student.lName);
      provider.editRegNoController =
          TextEditingController(text: student.regNum);
      provider.editAdmNoController =
          TextEditingController(text: student.admNum);
      provider.editDOBirthController =
          TextEditingController(text: student.dOBirth);
      provider.editDeptController = TextEditingController(text: student.dept);
      provider.editNationalityController =
          TextEditingController(text: student.nationality);
      provider.editGenderController =
          TextEditingController(text: student.gender);
      provider.editHouseNameController =
          TextEditingController(text: student.houseName);
      provider.editPostOfficeController =
          TextEditingController(text: student.postOffice);
      provider.editPlaceController = TextEditingController(text: student.place);
      provider.editEMailController = TextEditingController(text: student.eMail);
      provider.editParentNameController =
          TextEditingController(text: student.guardianName);
      provider.editMobileNumController =
          TextEditingController(text: student.mobNum);
      provider.editPasswordController =
          TextEditingController(text: student.password);
    });
    return Scaffold(
      backgroundColor: jOtherColor,
      appBar: AppBar(
        title: const Text('Edit Student'),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Container(
            color: jOtherColor,
            child: Form(
              key: provider.editFormKey,
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          minRadius: 50,
                          maxRadius: 50,
                          backgroundColor: jSecondaryColor,
                          backgroundImage:
                              AssetImage('assets/images/student.png'),
                        ),
                        jWidthBox,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '${student.fName} '
                                  '${student.lName}',
                                  style: jKalamLargeStyle,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  student.regNum.toUpperCase(),
                                  style: jAcmeMediumStyle,
                                ),
                                Text(
                                  student.dept.toUpperCase(),
                                  style: jAcmeMediumStyle,
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'First Name',
                              style: jAlegrayaSansSubTextStyle,
                            ),
                            SizedBox(
                              width: 200,
                              child: TextFormField(
                                controller: provider.editFirstNameController,
                                keyboardType: TextInputType.name,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text(
                                      'Enter First Name',
                                      style: jAlegrayaSansHeadTextStyle,
                                    )),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'First Name not filled';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        jHalfHeightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Last Name',
                              style: jAlegrayaSansSubTextStyle,
                            ),
                            SizedBox(
                              width: 200,
                              child: TextFormField(
                                controller: provider.editLastNameController,
                                keyboardType: TextInputType.name,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text(
                                      'Enter Last Name',
                                      style: jAlegrayaSansHeadTextStyle,
                                    )),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Last Name not filled';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        jHalfHeightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Register No.',
                              style: jAlegrayaSansSubTextStyle,
                            ),
                            SizedBox(
                              width: 200,
                              child: TextFormField(
                                controller: provider.editRegNoController,
                                keyboardType: TextInputType.name,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text(
                                      'Enter Register No.',
                                      style: jAlegrayaSansHeadTextStyle,
                                    )),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Register No. not filled';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        jHalfHeightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Admission No.',
                              style: jAlegrayaSansSubTextStyle,
                            ),
                            SizedBox(
                              width: 200,
                              child: TextFormField(
                                controller: provider.editAdmNoController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text(
                                      'Enter Admission No.',
                                      style: jAlegrayaSansHeadTextStyle,
                                    )),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Admission No. not filled';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        jHalfHeightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Date of Birth',
                              style: jAlegrayaSansSubTextStyle,
                            ),
                            SizedBox(
                              width: 200,
                              child: TextFormField(
                                controller: provider.editDOBirthController,
                                keyboardType: TextInputType.datetime,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text(
                                      'DD / MM / YYYY',
                                      style: jAlegrayaSansHeadTextStyle,
                                    )),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Date of Birth not filled';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        jHalfHeightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Department',
                              style: jAlegrayaSansSubTextStyle,
                            ),
                            SizedBox(
                              width: 200,
                              child: TextFormField(
                                controller: provider.editDeptController,
                                keyboardType: TextInputType.name,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text(
                                      'Enter Department',
                                      style: jAlegrayaSansHeadTextStyle,
                                    )),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Department not filled';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        jheightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Nationality',
                              style: jAlegrayaSansSubTextStyle,
                            ),
                            SizedBox(
                              width: 200,
                              child: TextFormField(
                                controller: provider.editNationalityController,
                                keyboardType: TextInputType.name,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text(
                                      'Enter Nationality',
                                      style: jAlegrayaSansHeadTextStyle,
                                    )),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Department not filled';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        jheightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Gender',
                              style: jAlegrayaSansSubTextStyle,
                            ),
                            SizedBox(
                              width: 200,
                              child: TextFormField(
                                controller: provider.editGenderController,
                                keyboardType: TextInputType.name,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text(
                                      'Enter Gender',
                                      style: jAlegrayaSansHeadTextStyle,
                                    )),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Department not filled';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        jheightBox,
                        jTwiceThickDivider,
                        const Text(
                          'Address Details',
                          style: jAlegrayaSansSubTextStyle,
                        ),
                        jTwiceThickDivider,
                        jheightBox,
                        //
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'House Name',
                              style: jAlegrayaSansSubTextStyle,
                            ),
                            SizedBox(
                              child: TextFormField(
                                controller: provider.editHouseNameController,
                                keyboardType: TextInputType.name,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text(
                                      'Enter House Name',
                                      style: jAlegrayaSansHeadTextStyle,
                                    )),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'E-Mail not filled';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        jheightBox,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Post Office',
                              style: jAlegrayaSansSubTextStyle,
                            ),
                            SizedBox(
                              child: TextFormField(
                                controller: provider.editPostOfficeController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text(
                                      'Enter Post Office',
                                      style: jAlegrayaSansHeadTextStyle,
                                    )),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'E-Mail not filled';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        jheightBox,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Place',
                              style: jAlegrayaSansSubTextStyle,
                            ),
                            SizedBox(
                              child: TextFormField(
                                controller: provider.editPlaceController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text(
                                      'Enter Place',
                                      style: jAlegrayaSansHeadTextStyle,
                                    )),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'E-Mail not filled';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ],
                        ),

                        jheightBox,
                        jTwiceThickDivider,
                        const Text(
                          'Contact Details',
                          style: jAlegrayaSansSubTextStyle,
                        ),
                        jTwiceThickDivider,
                        jheightBox,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'E-Mail',
                              style: jAlegrayaSansSubTextStyle,
                            ),
                            SizedBox(
                              child: TextFormField(
                                controller: provider.editEMailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text(
                                      'Enter E-Mail',
                                      style: jAlegrayaSansHeadTextStyle,
                                    )),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'E-Mail not filled';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        jheightBox,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Name of Parent/Guardian',
                              style: jAlegrayaSansSubTextStyle,
                            ),
                            SizedBox(
                              child: TextFormField(
                                controller: provider.editParentNameController,
                                keyboardType: TextInputType.name,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text(
                                      "Enter Parent's / Guardian's Name",
                                      style: jAlegrayaSansHeadTextStyle,
                                    )),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Parent/Guardian Name not filled';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        jheightBox,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Mobile Number',
                              style: jAlegrayaSansSubTextStyle,
                            ),
                            SizedBox(
                              child: TextFormField(
                                controller: provider.editMobileNumController,
                                keyboardType: TextInputType.phone,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text(
                                      'Enter Mobile Number',
                                      style: jAlegrayaSansHeadTextStyle,
                                    )),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Last Name not filled';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        jheightBox,
                        jTwiceThickDivider,
                        const Text(
                          'Login Details',
                          style: jAlegrayaSansSubTextStyle,
                        ),
                        jTwiceThickDivider,
                        jheightBox,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Password',
                              style: jAlegrayaSansSubTextStyle,
                            ),
                            SizedBox(
                              child: TextFormField(
                                controller: provider.editPasswordController,
                                keyboardType: TextInputType.phone,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text(
                                      'Edit Password',
                                      style: jAlegrayaSansHeadTextStyle,
                                    )),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Password not filled';
                                  } else if (value.length < 8) {
                                    return 'Password Must be atleast 8 characters';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (provider.editFormKey.currentState!.validate()) {
            provider.editStudentOntap(context, index);
            Navigator.of(context).pop();
          } else {}
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
