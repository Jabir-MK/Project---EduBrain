import 'package:edubrain/constants/constant.dart';
import 'package:edubrain/constants/fontstyle_constants.dart';
import 'package:edubrain/database/functions/db_functions.dart';
import 'package:edubrain/teacher/teacher_profile/teacher_profile_screen_details_model.dart';
import 'package:edubrain/teacher/teacher_profile/teacher_signout.dart';
import 'package:flutter/material.dart';

class TeacherProfileScreen extends StatefulWidget {
  const TeacherProfileScreen({
    super.key,
    required this.teacherFullName,
    required this.teacherGender,
    required this.teacherRegID,
    required this.teacherSubject,
    required this.teacherQualification,
    required this.teacherEMail,
    required this.teacherMobileNum,
    required this.teacherPassword,
  });

  static String routeName = 'TeacherProfileScreen';

  final String teacherFullName;
  final String teacherGender;
  final String teacherRegID;
  final String teacherSubject;
  final String teacherQualification;
  final String teacherEMail;
  final String teacherMobileNum;
  final String teacherPassword;

  @override
  State<TeacherProfileScreen> createState() => _TeacherProfileScreenState();
}

class _TeacherProfileScreenState extends State<TeacherProfileScreen> {
  late String teacherProfileName =
      TextEditingController(text: widget.teacherFullName).text;
  late String teacherProfileGender =
      TextEditingController(text: widget.teacherGender).text;
  late String teacherProfileRegID =
      TextEditingController(text: widget.teacherRegID).text;
  late String teacherProfileSubject =
      TextEditingController(text: widget.teacherSubject).text;
  late String teacherProfileQualification =
      TextEditingController(text: widget.teacherQualification).text;
  late String teacherProfileEMail =
      TextEditingController(text: widget.teacherEMail).text;
  late String teacherProfileMobileNum =
      TextEditingController(text: widget.teacherMobileNum).text;
  late String teacherProfilePassword =
      TextEditingController(text: widget.teacherPassword).text;

  @override
  void initState() {
    super.initState();
    getTeacherProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Profile',
          style: jAkayaTelivigalaAppDefaultStyle,
        ),
        actions: [
          IconButton(
            onPressed: () {
              confirmSignOutTeacher(context);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: teacherModelNotifier,
        builder: (context, teacherProfile, child) {
          return ListView(
            children: [
              Container(
                color: jOtherColor,
                child: Column(
                  children: [
                    TeacherProfileBasicIDInfo(
                      detailNameValue: teacherProfile.last.teacherName,
                      detailRegIDValue: teacherProfile.last.teacherRegID,
                      detailSubjectValue: teacherProfile.last.teacherSubject,
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
                      children: [
                        TeacherProfileBasicDetails(
                          detailTitle: "Full Name",
                          detailValue: teacherProfile.last.teacherName,
                        ),
                        TeacherProfileBasicDetails(
                          detailTitle: "Gender",
                          detailValue: teacherProfile.last.teacherGender,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        TeacherProfileBasicDetails(
                          detailTitle: "Register ID",
                          detailValue: teacherProfile.last.teacherRegID,
                        ),
                        TeacherProfileBasicDetails(
                          detailTitle: "Subject",
                          detailValue: teacherProfile.last.teacherSubject,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        TeacherProfileBasicDetails(
                          detailTitle: "Qualification",
                          detailValue: teacherProfile.last.teacherQualification,
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
                    TeacherProfileContactDetails(
                      detailsTitle: 'E-mail',
                      detailsValue: teacherProfile.last.teacherEMail,
                    ),
                    TeacherProfileContactDetails(
                      detailsTitle: 'Mobile Number',
                      detailsValue: teacherProfile.last.teacherMobileNum,
                    ),
                    jheightBox,
                    jTwiceThickDivider,
                    const Text(
                      'Login Details',
                      style: jAlegrayaSansSubTextStyle,
                    ),
                    jTwiceThickDivider,
                    jheightBox,
                    TeacherProfileContactDetails(
                      detailsTitle: 'Password',
                      detailsValue: teacherProfile.last.teacherPassword,
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
