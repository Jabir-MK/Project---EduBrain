import 'package:edubrain/core/constants/constant.dart';
import 'package:edubrain/core/constants/fontstyle_constants.dart';
import 'package:edubrain/database/functions/student_section.dart';
import 'package:edubrain/view/teacher/contents_screens/manage_student/add_student/add_student_screen.dart';
import 'package:edubrain/view/teacher/contents_screens/manage_student/edit_student.dart';

import 'package:edubrain/view/teacher/contents_screens/manage_student/view_student/student_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

class TeacherStudentManage extends StatelessWidget {
  const TeacherStudentManage({super.key});
  static String routeName = "TeacherStudentManage";

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<StudentDBProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      provider.getAllStudents();
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Manage Students",
          style: jAkayaTelivigalaAppDefaultStyle,
        ),
      ),
      body: Consumer<StudentDBProvider>(
        builder: (context, value, child) {
          return value.studentListDB.isEmpty
              ? const Center(
                  child: Text(
                    'No students',
                    style: TextStyle(color: jWhiteTextColor, fontSize: 20),
                  ),
                )
              : AnimationLimiter(
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: value.studentListDB.length,
                      itemBuilder: (context, index) {
                        final studentData = value.studentListDB[index];
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          delay: const Duration(milliseconds: 100),
                          child: SlideAnimation(
                            duration: const Duration(milliseconds: 2500),
                            curve: Curves.fastLinearToSlowEaseIn,
                            horizontalOffset: 30,
                            verticalOffset: 300,
                            child: FlipAnimation(
                              duration: const Duration(milliseconds: 3000),
                              curve: Curves.fastLinearToSlowEaseIn,
                              flipAxis: FlipAxis.y,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ViewStudentProfile(
                                      studentFirstName: studentData.fName,
                                      studentLastName: studentData.lName,
                                      studentRegNo: studentData.regNum,
                                      studentAdmNo: studentData.admNum,
                                      studentDOBirth: studentData.dOBirth,
                                      studentDept: studentData.dept,
                                      studentNationality:
                                          studentData.nationality,
                                      studentGender: studentData.gender,
                                      studentHouseName: studentData.houseName,
                                      studentPostOffice: studentData.postOffice,
                                      studentPlace: studentData.place,
                                      studentEMail: studentData.eMail,
                                      studentParentName:
                                          studentData.guardianName,
                                      studentMobileNum: studentData.mobNum,
                                      studentPassword: studentData.password,
                                    ),
                                  ));
                                },
                                child: Container(
                                  padding:
                                      const EdgeInsets.all(jDefaultPadding / 2),
                                  margin: const EdgeInsets.all(jDefaultPadding),
                                  decoration: BoxDecoration(
                                    color: jOtherColor,
                                    borderRadius:
                                        BorderRadius.circular(jDefaultPadding),
                                    boxShadow: [
                                      BoxShadow(
                                        offset: const Offset(10, 10),
                                        blurRadius: 5,
                                        blurStyle: BlurStyle.inner,
                                        color: Colors.black.withOpacity(0.2),
                                        spreadRadius: 1,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          const CircleAvatar(
                                            radius: 30,
                                            backgroundImage: AssetImage(
                                                'assets/images/student.png'),
                                          ),
                                          jWidthBox,
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              jWidthBox,
                                              Text(
                                                '${studentData.fName} '
                                                '${studentData.lName}',
                                                style:
                                                    jStudentMangeNameTextStyle,
                                              ),
                                              jHalfHeightBox,
                                              Text(
                                                studentData.regNum,
                                                style:
                                                    jStudentManageSubjectTextStyle,
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      const Divider(
                                        height: 20,
                                        thickness: 2,
                                        color: jPrimaryColor,
                                        indent: 5,
                                        endIndent: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextButton.icon(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      EditStudentScreen(
                                                    index: index,
                                                    student: studentData,
                                                  ),
                                                ),
                                              );
                                            },
                                            icon: const Icon(
                                              Icons.edit_outlined,
                                              color: jPrimaryColor,
                                            ),
                                            label: const Text(
                                              'Edit',
                                              style: jEditButtonTextStyle,
                                            ),
                                          ),
                                          TextButton.icon(
                                              onPressed: () {
                                                value.deleteStudent(index);
                                              },
                                              icon: const Icon(
                                                  Icons.delete_outline,
                                                  color: jErrorBorderColor),
                                              label: const Text(
                                                'Delete',
                                                style: jDeleteButtonTextStyle,
                                              ))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                );
        },
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
