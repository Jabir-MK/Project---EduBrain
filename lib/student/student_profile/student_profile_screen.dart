import 'package:edubrain/constants/constant.dart';
import 'package:edubrain/constants/fontstyle_constants.dart';
import 'package:edubrain/student/student_profile/student_profile_screen_details_model.dart';
import 'package:edubrain/student/student_profile/student_signout.dart';
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
                const StudentProfileBasicIDInfo(),
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
                    StudentProfileBasicDetails(
                      detailTitle: "First Name",
                      detailValue: "Jabir ",
                    ),
                    StudentProfileBasicDetails(
                      detailTitle: "Last Name",
                      detailValue: "MK",
                    ),
                  ],
                ),
                Row(
                  children: const [
                    StudentProfileBasicDetails(
                      detailTitle: "Register Number",
                      detailValue: "GVATCS024",
                    ),
                    StudentProfileBasicDetails(
                      detailTitle: "Admission Number",
                      detailValue: "000011",
                    ),
                  ],
                ),
                Row(
                  children: const [
                    StudentProfileBasicDetails(
                      detailTitle: "Date Of Birth",
                      detailValue: "01 Dec 2000",
                    ),
                    StudentProfileBasicDetails(
                      detailTitle: "Department",
                      detailValue: "Computer Science",
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
                const StudentProfileContactDetails(
                  detailsTitle: 'E-mail',
                  detailsValue: 'jabirmanakkanakath@gmail.com',
                ),
                const StudentProfileContactDetails(
                  detailsTitle: "Name of Parent/Guardian",
                  detailsValue: "Zainul Habid",
                ),
                const StudentProfileContactDetails(
                  detailsTitle: 'Mobile Number',
                  detailsValue: "+91 8589952276",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
