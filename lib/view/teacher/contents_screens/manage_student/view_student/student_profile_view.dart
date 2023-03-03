import 'package:edubrain/core/constants/constant.dart';
import 'package:edubrain/core/constants/fontstyle_constants.dart';
import 'package:edubrain/view/student/student_profile/student_profile_screen_details_model.dart';
import 'package:flutter/material.dart';

class ViewStudentProfile extends StatelessWidget {
  const ViewStudentProfile({
    super.key,
    required this.studentFirstName,
    required this.studentLastName,
    required this.studentRegNo,
    required this.studentAdmNo,
    required this.studentDOBirth,
    required this.studentDept,
    required this.studentNationality,
    required this.studentGender,
    required this.studentHouseName,
    required this.studentPostOffice,
    required this.studentPlace,
    required this.studentEMail,
    required this.studentParentName,
    required this.studentMobileNum,
    required this.studentPassword,
  });

  static String routeName = 'ViewStudentProfile';

  final String studentFirstName;
  final String studentLastName;
  final String studentRegNo;
  final String studentAdmNo;
  final String studentDOBirth;
  final String studentDept;
  final String studentNationality;
  final String studentGender;
  final String studentHouseName;
  final String studentPostOffice;
  final String studentPlace;
  final String studentEMail;
  final String studentParentName;
  final String studentMobileNum;
  final String studentPassword;

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Profile'),
      ),
      body: ListView(
        children: [
          Container(
            color: jOtherColor,
            child: Column(
              children: [
                StudentProfileBasicIDInfo(
                  headDept: studentDept,
                  headRegID: studentRegNo,
                  headFirstName: studentFirstName,
                  headLastName: studentLastName,
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
                    StudentProfileBasicDetails(
                      detailTitle: "First Name",
                      detailValue: studentFirstName,
                    ),
                    StudentProfileBasicDetails(
                      detailTitle: "Last Name",
                      detailValue: studentLastName,
                    ),
                  ],
                ),
                Row(
                  children: [
                    StudentProfileBasicDetails(
                      detailTitle: "Register Number",
                      detailValue: studentRegNo,
                    ),
                    StudentProfileBasicDetails(
                      detailTitle: "Admission Number",
                      detailValue: studentAdmNo,
                    ),
                  ],
                ),
                Row(
                  children: [
                    StudentProfileBasicDetails(
                      detailTitle: "Date Of Birth",
                      detailValue: studentDOBirth,
                    ),
                    StudentProfileBasicDetails(
                      detailTitle: "Department",
                      detailValue: studentDept,
                    ),
                  ],
                ),
                Row(
                  children: [
                    StudentProfileBasicDetails(
                      detailTitle: 'Nationality',
                      detailValue: studentNationality,
                    ),
                    StudentProfileBasicDetails(
                      detailTitle: 'Gender',
                      detailValue: studentGender,
                    )
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
                StudentProfileAddressDetails(
                  detailsHead: 'House Name',
                  detailsValue: studentHouseName,
                ),
                StudentProfileAddressDetails(
                  detailsHead: 'Post Office',
                  detailsValue: studentPostOffice,
                ),
                StudentProfileAddressDetails(
                  detailsHead: 'Place',
                  detailsValue: studentPlace,
                ),
                jheightBox,
                jTwiceThickDivider,
                const Text(
                  'Contact Details',
                  style: jAlegrayaSansSubTextStyle,
                ),
                jTwiceThickDivider,
                jheightBox,
                StudentProfileContactDetails(
                  detailsTitle: 'E-mail',
                  detailsValue: studentEMail,
                ),
                StudentProfileContactDetails(
                  detailsTitle: "Name of Parent/Guardian",
                  detailsValue: studentParentName,
                ),
                StudentProfileContactDetails(
                  detailsTitle: 'Mobile Number',
                  detailsValue: studentMobileNum,
                ),
                jheightBox,
                jTwiceThickDivider,
                const Text(
                  'Login Details',
                  style: jAlegrayaSansSubTextStyle,
                ),
                jTwiceThickDivider,
                jheightBox,
                StudentProfileContactDetails(
                  detailsTitle: 'Password',
                  detailsValue: studentPassword,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
