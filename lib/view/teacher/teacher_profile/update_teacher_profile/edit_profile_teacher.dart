import 'package:edubrain/constants/constant.dart';
import 'package:edubrain/constants/fontstyle_constants.dart';
import 'package:edubrain/database/functions/teacher_section.dart';
import 'package:edubrain/database/model/teacher_model/teacher_data_model.dart';
import 'package:edubrain/view/teacher/login_screen/login_teacher/teacher_login_screen.dart';
import 'package:flutter/material.dart';

class EditTeacherProfileScreen extends StatefulWidget {
  const EditTeacherProfileScreen({
    super.key,
    required this.teacherName,
    required this.teacherGender,
    required this.teacherRegID,
    required this.teacherSubject,
    required this.teacherQualification,
    required this.teacherEMail,
    required this.teacherMobileNum,
    required this.teacherPassword,
    required this.index,
  });
  static String routeName = 'EditTeacherProfileScreen';

  final String teacherGender;
  final String teacherRegID;
  final String teacherName;
  final String teacherSubject;
  final String teacherQualification;
  final String teacherEMail;
  final String teacherMobileNum;
  final String teacherPassword;

  final int index;

  @override
  State<EditTeacherProfileScreen> createState() =>
      _EditTeacherProfileScreenState();
}

class _EditTeacherProfileScreenState extends State<EditTeacherProfileScreen> {
  TextEditingController _teacherNameEditController = TextEditingController();
  TextEditingController _teacherRegIDEditController = TextEditingController();
  TextEditingController _teacherGenderEditController = TextEditingController();
  TextEditingController _teacherQaulEditController = TextEditingController();
  TextEditingController _teacherSubjectEditController = TextEditingController();
  TextEditingController _teacherEmailEditController = TextEditingController();
  TextEditingController _teacherMobileEditController = TextEditingController();
  TextEditingController _teacherPasswordEditController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _teacherNameEditController =
        TextEditingController(text: widget.teacherName);
    _teacherGenderEditController =
        TextEditingController(text: widget.teacherGender);
    _teacherRegIDEditController =
        TextEditingController(text: widget.teacherRegID);
    _teacherQaulEditController =
        TextEditingController(text: widget.teacherQualification);
    _teacherSubjectEditController =
        TextEditingController(text: widget.teacherSubject);
    _teacherEmailEditController =
        TextEditingController(text: widget.teacherEMail);
    _teacherMobileEditController =
        TextEditingController(text: widget.teacherMobileNum);
    _teacherPasswordEditController =
        TextEditingController(text: widget.teacherPassword);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Profile',
          style: jAkayaTelivigalaAppDefaultStyle,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Container(
            color: jOtherColor,
            child: Form(
              key: _formKey,
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
                                  _teacherNameEditController.text.toUpperCase(),
                                  style: jKalamLargeStyle,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _teacherRegIDEditController.text
                                      .toUpperCase(),
                                  style: jAcmeMediumStyle,
                                ),
                                Text(
                                  _teacherSubjectEditController.text
                                      .toUpperCase(),
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
                              'Full Name',
                              style: jAlegrayaSansSubTextStyle,
                            ),
                            SizedBox(
                              width: 200,
                              child: TextFormField(
                                controller: _teacherNameEditController,
                                keyboardType: TextInputType.name,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text(
                                      'Enter Full Name',
                                      style: jAlegrayaSansHeadTextStyle,
                                    )),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Full Name not filled';
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
                              'Register ID',
                              style: jAlegrayaSansSubTextStyle,
                            ),
                            SizedBox(
                              width: 200,
                              child: TextFormField(
                                controller: _teacherRegIDEditController,
                                keyboardType: TextInputType.name,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text(
                                      'Enter Register ID',
                                      style: jAlegrayaSansHeadTextStyle,
                                    )),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Register ID not filled';
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
                              'Gender',
                              style: jAlegrayaSansSubTextStyle,
                            ),
                            SizedBox(
                              width: 200,
                              child: TextFormField(
                                controller: _teacherGenderEditController,
                                keyboardType: TextInputType.name,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text(
                                      'Enter Your Gender',
                                      style: jAlegrayaSansHeadTextStyle,
                                    )),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Gender not filled';
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
                              'Qaulification',
                              style: jAlegrayaSansSubTextStyle,
                            ),
                            SizedBox(
                              width: 200,
                              child: TextFormField(
                                controller: _teacherQaulEditController,
                                keyboardType: TextInputType.name,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text(
                                      'Enter Your Qualification',
                                      style: jAlegrayaSansHeadTextStyle,
                                    )),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Qaulification has not filled';
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
                              'Subject',
                              style: jAlegrayaSansSubTextStyle,
                            ),
                            SizedBox(
                              width: 200,
                              child: TextFormField(
                                controller: _teacherSubjectEditController,
                                keyboardType: TextInputType.name,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text(
                                      'Enter Your Subject',
                                      style: jAlegrayaSansHeadTextStyle,
                                    )),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Subject not filled';
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
                                controller: _teacherEmailEditController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text(
                                      'Enter E-Mail',
                                      style: jAlegrayaSansHeadTextStyle,
                                    )),
                                validator: (value) {
                                  RegExp regExp = RegExp(emailPattern);
                                  if (value == null || value.isEmpty) {
                                    return "Please Enter Your E-mail";
                                  } else if (!regExp.hasMatch(value)) {
                                    return "Please enter valid details";
                                  }
                                  return null;
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
                                controller: _teacherMobileEditController,
                                keyboardType: TextInputType.phone,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text(
                                      'Enter Mobile Number',
                                      style: jAlegrayaSansHeadTextStyle,
                                    )),
                                validator: (value) {
                                  if (value == null ||
                                      value.isEmpty ||
                                      value.length != 10) {
                                    return 'Mobile Number not filled';
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
                                controller: _teacherPasswordEditController,
                                keyboardType: TextInputType.name,
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
          if (_formKey.currentState!.validate()) {
            editTeacherProfileOnTap(context);
            setState(() {});
            Navigator.of(context).pop(userTeacher);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: jSecondaryColor,
                behavior: SnackBarBehavior.floating,
                margin: EdgeInsets.all(jDefaultPadding),
                content: Text("Field is empty"),
              ),
            );
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

  Future<void> editTeacherProfileOnTap(context) async {
    final teacherNameEdit = _teacherNameEditController.text.trim();
    final teacherRegIDEdit = _teacherRegIDEditController.text.trim();
    final teacherGenderEdit = _teacherGenderEditController.text.trim();
    final teacherQualificationEdit = _teacherQaulEditController.text.trim();
    final teacherSubjectEdit = _teacherSubjectEditController.text.trim();
    final teacherEmailEdit = _teacherEmailEditController.text.trim();
    final teacherMobileNumEdit = _teacherMobileEditController.text.trim();
    final teacherPasswordEdit = _teacherPasswordEditController.text.trim();

    if (teacherMobileNumEdit.isEmpty ||
        teacherPasswordEdit.isEmpty ||
        teacherEmailEdit.isEmpty ||
        teacherNameEdit.isEmpty ||
        teacherRegIDEdit.isEmpty ||
        teacherGenderEdit.isEmpty ||
        teacherQualificationEdit.isEmpty ||
        teacherSubjectEdit.isEmpty) {
      return;
    } else {
      final teacherEdit = TeacherModel(
        DateTime.now().millisecond,
        teacherRegID: teacherRegIDEdit,
        teacherSubject: teacherSubjectEdit,
        teacherQualification: teacherQualificationEdit,
        teacherGender: teacherGenderEdit,
        teacherMobileNum: teacherMobileNumEdit,
        teacherName: teacherNameEdit,
        teacherEMail: teacherEmailEdit,
        teacherPassword: teacherPasswordEdit,
      );
      editTeacherProfile(widget.index, teacherEdit);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: jSecondaryColor,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(jDefaultPadding),
          content: Text("Updated Profile Successfully"),
        ),
      );
    }
  }
}
