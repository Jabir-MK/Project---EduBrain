import 'package:edubrain/core/constants/constant.dart';
import 'package:edubrain/core/constants/fontstyle_constants.dart';
import 'package:edubrain/view/teacher/login_screen/login_teacher/teacher_login_screen.dart';
import 'package:edubrain/view/teacher/teacher_profile/update_teacher_profile/edit_profile_teacher.dart';
import 'package:flutter/material.dart';

class TeacherProfileBasicIDInfo extends StatelessWidget {
  const TeacherProfileBasicIDInfo({
    super.key,
    required this.detailNameValue,
    required this.detailSubjectValue,
    required this.detailRegIDValue,
  });
  final String detailNameValue;
  final String detailSubjectValue;
  final String detailRegIDValue;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            backgroundImage: AssetImage('assets/images/teacher.png'),
          ),
          jWidthBox,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    detailNameValue,
                    style: jKalamLargeStyle,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    detailSubjectValue,
                    style: jAcmeMediumStyle,
                  ),
                  Text(
                    detailRegIDValue,
                    style: jAcmeMediumStyle,
                  ),
                ],
              ),
              ElevatedButton.icon(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(jSecondaryColor),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => EditTeacherProfileScreen(
                        index: userTeacher!.id,
                        teacherName: userTeacher!.teacherName,
                        teacherGender: userTeacher!.teacherGender,
                        teacherRegID: userTeacher!.teacherRegID,
                        teacherSubject: userTeacher!.teacherSubject,
                        teacherQualification: userTeacher!.teacherQualification,
                        teacherEMail: userTeacher!.teacherEMail,
                        teacherMobileNum: userTeacher!.teacherMobileNum,
                        teacherPassword: userTeacher!.teacherPassword,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.edit),
                label: const Text(
                  'Edit Profile',
                  style: jAlegrayaSansButtonTextStyle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TeacherProfileAddressDetails extends StatelessWidget {
  const TeacherProfileAddressDetails({
    super.key,
    required this.detailsHead,
    required this.detailsValue,
  });

  final String detailsHead;
  final String detailsValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              detailsHead,
              style: jAlegrayaSansHeadTextStyle,
            ),
            jheightBox,
            Text(
              detailsValue,
              style: jAlegrayaSansSubTextStyle,
            ),
            jHalfHeightBox,
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.1,
              child: jDefaultDivider,
            )
          ],
        ),
      ],
    );
  }
}

class TeacherProfileBasicDetails extends StatelessWidget {
  const TeacherProfileBasicDetails(
      {super.key, required this.detailTitle, required this.detailValue});
  final String detailTitle;
  final String detailValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          right: jDefaultPadding / 2,
          left: jDefaultPadding / 4,
          top: jDefaultPadding / 2),
      width: MediaQuery.of(context).size.width / 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                detailTitle,
                style: jAlegrayaSansHeadTextStyle,
              ),
              jHalfHeightBox,
              Text(
                detailValue,
                style: jAlegrayaSansSubTextStyle,
              ),
              jHalfHeightBox,
              SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                child: jDefaultDivider,
              )
            ],
          ),
        ],
      ),
    );
  }
}

class TeacherProfileContactDetails extends StatelessWidget {
  const TeacherProfileContactDetails(
      {super.key, required this.detailsTitle, required this.detailsValue});
  final String detailsTitle;
  final String detailsValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              detailsTitle,
              style: jAlegrayaSansHeadTextStyle,
            ),
            jheightBox,
            Text(
              detailsValue,
              style: jAlegrayaSansSubTextStyle,
            ),
            jHalfHeightBox,
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.1,
              child: jDefaultDivider,
            )
          ],
        ),
        const Icon(
          Icons.lock_outline,
          size: 25,
        )
      ],
    );
  }
}
