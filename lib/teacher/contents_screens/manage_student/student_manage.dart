import 'package:edubrain/constants/constant.dart';
import 'package:edubrain/constants/fontstyle_constants.dart';
import 'package:edubrain/constants/timetable/styles_timetable.dart';
import 'package:edubrain/teacher/contents_screens/manage_student/add_student/add_student_screen.dart';
import 'package:edubrain/teacher/contents_screens/manage_student/student_list/student_data_model/student_data_model.dart';
import 'package:edubrain/teacher/contents_screens/manage_student/student_profile/student_profile_view.dart';
import 'package:flutter/material.dart';

class TeacherStudentManage extends StatelessWidget {
  const TeacherStudentManage({super.key});
  static String routeName = "TeacherStudentManage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Manage Students",
          style: jAkayaTelivigalaAppDefaultStyle,
        ),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: studentList.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, ViewStudentProfile.routeName);
          },
          child: Container(
            padding: const EdgeInsets.all(jDefaultPadding),
            margin: const EdgeInsets.all(jDefaultPadding),
            decoration: BoxDecoration(
              color: jOtherColor,
              borderRadius: BorderRadius.circular(jDefaultPadding),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(10, 10),
                  blurRadius: 10,
                  blurStyle: BlurStyle.inner,
                  color: jSecondaryColor,
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/student.png'),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        jWidthBox,
                        Text(
                          '${studentList[index].firstName} '
                          '${studentList[index].lastName}',
                          style: jTimeTableTeacherNameTextStyle,
                        ),
                        jHalfHeightBox,
                        Text(
                          studentList[index].registerNum,
                          style: jTimeTablePeriodTextStyle,
                        ),
                      ],
                    )
                  ],
                ),
                jheightBox,
                const Divider(
                  height: 20,
                  thickness: 2,
                  color: jPrimaryColor,
                  indent: 5,
                  endIndent: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit_outlined,
                        color: jPrimaryColor,
                      ),
                      label: const Text(
                        'Edit',
                        style: jTimeTablePeriodDurationTextStyle,
                      ),
                    ),
                    TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.delete_outline,
                            color: jPrimaryColor),
                        label: const Text(
                          'Delete',
                          style: jTimeTablePeriodDurationTextStyle,
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddStudentScreen.routeName);
        },
        backgroundColor: jPrimaryColor,
        elevation: 20,
        child: const Icon(
          Icons.add,
          size: 35,
        ),
      ),
    );
  }
}
