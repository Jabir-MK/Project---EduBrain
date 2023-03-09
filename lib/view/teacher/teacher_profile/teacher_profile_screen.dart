import 'package:edubrain/core/constants/constant.dart';
import 'package:edubrain/core/constants/fontstyle_constants.dart';
import 'package:edubrain/database/functions/teacher_section.dart';
import 'package:edubrain/view/teacher/login_screen/login_teacher/teacher_login_screen.dart';
import 'package:edubrain/view/teacher/teacher_profile/teacher_profile_screen_details_model.dart';
import 'package:edubrain/view/teacher/teacher_profile/teacher_signout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TeacherProfileScreen extends StatelessWidget {
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
    required this.currentIndex,
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

  final int currentIndex;

  // late String teacherProfileName =
  //     TextEditingController(text: widget.teacherFullName).text;
  // late String teacherProfileGender =
  //     TextEditingController(text: widget.teacherGender).text;
  // late String teacherProfileRegID =
  //     TextEditingController(text: widget.teacherRegID).text;
  // late String teacherProfileSubject =
  //     TextEditingController(text: widget.teacherSubject).text;
  // late String teacherProfileQualification =
  //     TextEditingController(text: widget.teacherQualification).text;
  // late String teacherProfileEMail =
  //     TextEditingController(text: widget.teacherEMail).text;
  // late String teacherProfileMobileNum =
  //     TextEditingController(text: widget.teacherMobileNum).text;
  // late String teacherProfilePassword =
  //     TextEditingController(text: widget.teacherPassword).text;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TeacherDBProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      userTeacher;
      provider.getTeacherProfile();
    });
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
      body: Consumer<TeacherDBProvider>(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Container(
                color: jOtherColor,
                child: Column(
                  children: [
                    TeacherProfileBasicIDInfo(
                      detailNameValue: teacherFullName,
                      detailRegIDValue: teacherRegID,
                      detailSubjectValue: teacherSubject,
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
                          detailValue: teacherFullName,
                        ),
                        TeacherProfileBasicDetails(
                          detailTitle: "Gender",
                          detailValue: teacherGender,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        TeacherProfileBasicDetails(
                          detailTitle: "Register ID",
                          detailValue: teacherRegID,
                        ),
                        TeacherProfileBasicDetails(
                          detailTitle: "Subject",
                          detailValue: teacherSubject,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        TeacherProfileBasicDetails(
                          detailTitle: "Qualification",
                          detailValue: teacherQualification,
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
                      detailsValue: teacherEMail,
                    ),
                    TeacherProfileContactDetails(
                      detailsTitle: 'Mobile Number',
                      detailsValue: teacherMobileNum,
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
                      detailsValue: teacherPassword,
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
