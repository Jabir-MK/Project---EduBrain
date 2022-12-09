import 'dart:developer';

import 'package:edubrain/constants/constant.dart';
import 'package:edubrain/constants/fontstyle_constants.dart';
import 'package:edubrain/teacher/teacher_profile/update_teacher_profile/update_teacher_details.dart';
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

  @override
  State<EditTeacherProfileScreen> createState() =>
      _EditTeacherProfileScreenState();
}

class _EditTeacherProfileScreenState extends State<EditTeacherProfileScreen> {
  late String updateTeacherName =
      TextEditingController(text: widget.teacherName).text;
  @override
  void initState() {
    super.initState();
    log(updateTeacherName);
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
        children: [
          Container(
            color: jOtherColor,
            child: Column(
              children: [
                const EditTeacherProfileBasicIDInfo(
                  detailNameValue: 'jabir',
                  detailRegIDValue: 'ebmm012',
                  detailSubjectValue: 'physics',
                ),
                jheightBox,
                jTwiceThickDivider,
                const Text(
                  'Basic Details',
                  style: jAlegrayaSansSubTextStyle,
                ),
                jTwiceThickDivider,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    EditTeacherProfileBasicDetails(
                      detailTitle: "Full Name",
                      detailValue: '',
                    ),
                    EditTeacherProfileBasicDetails(
                      detailTitle: "Gender",
                      detailValue: '',
                    ),
                  ],
                ),
                Row(
                  children: const [
                    EditTeacherProfileBasicDetails(
                      detailTitle: "Register ID",
                      detailValue: '',
                    ),
                    EditTeacherProfileBasicDetails(
                      detailTitle: "Subject",
                      detailValue: '',
                    ),
                  ],
                ),
                Row(
                  children: const [
                    EditTeacherProfileBasicDetails(
                      detailTitle: "Qualification",
                      detailValue: '',
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
                const EditTeacherProfileContactDetails(
                  detailsTitle: 'E-mail',
                  detailsValue: '',
                ),
                const EditTeacherProfileContactDetails(
                  detailsTitle: 'Mobile Number',
                  detailsValue: '',
                ),
                jheightBox,
                jTwiceThickDivider,
                const Text(
                  'Login Details',
                  style: jAlegrayaSansSubTextStyle,
                ),
                jTwiceThickDivider,
                jheightBox,
                const EditTeacherProfileContactDetails(
                  detailsTitle: 'Password',
                  detailsValue: '',
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: jPrimaryColor,
        child: const Icon(
          Icons.check,
          size: 40,
        ),
      ),
    );
  }
}
