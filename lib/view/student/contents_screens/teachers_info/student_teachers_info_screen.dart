import 'package:edubrain/constants/constant.dart';
import 'package:edubrain/constants/fontstyle_constants.dart';
import 'package:edubrain/view/student/contents_screens/teachers_info/teacher_profile_data/teacher_profile_data.dart';
import 'package:edubrain/view/student/contents_screens/teachers_info/teacher_profileview/teacher_profile_view.dart';
import 'package:flutter/material.dart';

class InStudentTeachersInfoScreen extends StatelessWidget {
  const InStudentTeachersInfoScreen({super.key});
  static String routeName = "InStudentTeachersInfoScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Teachers Information",
          style: jAkayaTelivigalaAppDefaultStyle,
        ),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: teachersList.length,
        padding: const EdgeInsets.all(jDefaultPadding),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, ViewTeacherProfile.routeName);
          },
          child: Container(
            margin: const EdgeInsets.only(top: jDefaultPadding),
            padding: const EdgeInsets.all(jDefaultPadding),
            decoration: BoxDecoration(
                color: jOtherColor,
                borderRadius: BorderRadius.circular(jDefaultPadding),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 10,
                    offset: Offset(10, 10),
                    blurStyle: BlurStyle.inner,
                    color: jSecondaryColor,
                  ),
                ]),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/teacher.png'),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          teachersList[index].subject,
                          style: jTimeTableSubjectTextStyle,
                        ),
                        Text(
                          teachersList[index].teacherName,
                          style: jTimeTableTeacherNameTextStyle,
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
