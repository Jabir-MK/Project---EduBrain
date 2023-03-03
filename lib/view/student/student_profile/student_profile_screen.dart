import 'package:edubrain/core/constants/constant.dart';
import 'package:edubrain/core/constants/fontstyle_constants.dart';
import 'package:edubrain/view/student/login_screen/student_login_screen.dart';
import 'package:edubrain/view/student/student_profile/student_profile_screen_details_model.dart';
import 'package:edubrain/view/student/student_profile/student_signout.dart';
import 'package:flutter/material.dart';

class StudentProfileScreen extends StatelessWidget {
  const StudentProfileScreen({super.key});

  static String routeName = 'StudentProfileScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          "My Profile",
          style: jAkayaTelivigalaAppDefaultStyle,
        ),
        actions: [
          IconButton(
            onPressed: () {
              confirmSignOutStudent(context);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            color: jOtherColor,
            child: Column(
              children: [
                StudentProfileBasicIDInfo(
                  headDept: studentLoginList[0].dept,
                  headRegID: studentLoginList[0].regNum,
                  headFirstName: studentLoginList[0].fName,
                  headLastName: studentLoginList[0].lName,
                ),
                jheightBox,
                jTwiceThickDivider,
                const Text(
                  'Basic Details',
                  style: jAlegrayaSansSubTextStyle,
                ),
                jTwiceThickDivider,
                Row(
                  children: [
                    StudentProfileBasicDetails(
                      detailTitle: "First Name",
                      detailValue: studentLoginList[0].fName,
                    ),
                    StudentProfileBasicDetails(
                      detailTitle: "Last Name",
                      detailValue: studentLoginList[0].lName,
                    ),
                  ],
                ),
                Row(
                  children: [
                    StudentProfileBasicDetails(
                      detailTitle: "Register Number",
                      detailValue: studentLoginList[0].regNum,
                    ),
                    StudentProfileBasicDetails(
                      detailTitle: "Admission Number",
                      detailValue: studentLoginList[0].admNum,
                    ),
                  ],
                ),
                Row(
                  children: [
                    StudentProfileBasicDetails(
                      detailTitle: "Date Of Birth",
                      detailValue: studentLoginList[0].dOBirth,
                    ),
                    StudentProfileBasicDetails(
                      detailTitle: "Department",
                      detailValue: studentLoginList[0].dept,
                    ),
                  ],
                ),
                Row(
                  children: [
                    StudentProfileBasicDetails(
                      detailTitle: 'Nationality',
                      detailValue: studentLoginList[0].nationality,
                    ),
                    StudentProfileBasicDetails(
                      detailTitle: 'Gender',
                      detailValue: studentLoginList[0].gender,
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
                  detailsValue: studentLoginList[0].houseName,
                ),
                StudentProfileAddressDetails(
                  detailsHead: 'Post Office',
                  detailsValue: studentLoginList[0].postOffice,
                ),
                StudentProfileAddressDetails(
                  detailsHead: 'Place',
                  detailsValue: studentLoginList[0].place,
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
                  detailsValue: studentLoginList[0].eMail,
                ),
                StudentProfileContactDetails(
                  detailsTitle: "Name of Parent/Guardian",
                  detailsValue: studentLoginList[0].guardianName,
                ),
                StudentProfileContactDetails(
                  detailsTitle: 'Mobile Number',
                  detailsValue: studentLoginList[0].mobNum,
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
                  detailsValue: studentLoginList[0].password,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
