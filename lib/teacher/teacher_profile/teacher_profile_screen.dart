import 'package:edubrain/constants/constant.dart';
import 'package:edubrain/constants/fontstyle_constants.dart';
import 'package:edubrain/teacher/teacher_profile/teacher_profile_screen_details_model.dart';
import 'package:edubrain/teacher/teacher_profile/teacher_signout.dart';
import 'package:flutter/material.dart';

class TeacherProfileScreen extends StatelessWidget {
  const TeacherProfileScreen({super.key});

  static String routeName = 'TeacherProfileScreen';

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
              confirmSignOutTeacher(context);
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
                const TeacherProfileBasicIDInfo(),
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
                    TeacherProfileBasicDetails(
                      detailTitle: "First Name",
                      detailValue: "Fabina ",
                    ),
                    TeacherProfileBasicDetails(
                      detailTitle: "Last Name",
                      detailValue: "MK",
                    ),
                  ],
                ),
                Row(
                  children: const [
                    TeacherProfileBasicDetails(
                      detailTitle: "Register ID",
                      detailValue: "EBMM0012",
                    ),
                    TeacherProfileBasicDetails(
                      detailTitle: "Subject",
                      detailValue: "Mathematics",
                    ),
                  ],
                ),
                Row(
                  children: const [
                    TeacherProfileBasicDetails(
                      detailTitle: "Qualification",
                      detailValue: "Msc.Mathematics",
                    ),
                    TeacherProfileBasicDetails(
                      detailTitle: "Gender",
                      detailValue: "Female",
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
                const TeacherProfileContactDetails(
                  detailsTitle: 'E-mail',
                  detailsValue: 'fabinamk@gmail.com',
                ),
                const TeacherProfileContactDetails(
                  detailsTitle: "Name of Parent/Guardian",
                  detailsValue: "Zainul Habid",
                ),
                const TeacherProfileContactDetails(
                  detailsTitle: 'Mobile Number',
                  detailsValue: "+91 9946445464",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
