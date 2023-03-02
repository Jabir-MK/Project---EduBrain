import 'package:edubrain/constants/constant.dart';
import 'package:edubrain/constants/fontstyle_constants.dart';
import 'package:edubrain/database/functions/student_section.dart';
import 'package:edubrain/database/model/student/student_data_model.dart';
import 'package:edubrain/view/teacher/contents_screens/manage_student/add_student/add_student_screen.dart';
import 'package:edubrain/view/teacher/contents_screens/manage_student/edit_student.dart';

import 'package:edubrain/view/teacher/contents_screens/manage_student/view_student/student_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class TeacherStudentManage extends StatefulWidget {
  const TeacherStudentManage({super.key});
  static String routeName = "TeacherStudentManage";

  @override
  State<TeacherStudentManage> createState() => _TeacherStudentManageState();
}

class _TeacherStudentManageState extends State<TeacherStudentManage> {
  @override
  void initState() {
    super.initState();
    getAllStudents();
  }

  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Manage Students",
          style: jAkayaTelivigalaAppDefaultStyle,
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: studentListNotifier,
        builder: (BuildContext context, List<StudentModel> studentList,
            Widget? child) {
          return AnimationLimiter(
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: studentList.length,
                itemBuilder: (context, index) {
                  final studentData = studentList[index];

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
                                studentNationality: studentData.nationality,
                                studentGender: studentData.gender,
                                studentHouseName: studentData.houseName,
                                studentPostOffice: studentData.postOffice,
                                studentPlace: studentData.place,
                                studentEMail: studentData.eMail,
                                studentParentName: studentData.guardianName,
                                studentMobileNum: studentData.mobNum,
                                studentPassword: studentData.password,
                              ),
                            ));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(jDefaultPadding / 2),
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
                                          '${studentList[index].fName} '
                                          '${studentList[index].lName}',
                                          style: jStudentMangeNameTextStyle,
                                        ),
                                        jHalfHeightBox,
                                        Text(
                                          studentList[index].regNum,
                                          style: jStudentManageSubjectTextStyle,
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
                                              editFName: studentData.fName,
                                              editLName: studentData.lName,
                                              editRegNo: studentData.regNum,
                                              editAdmNo: studentData.admNum,
                                              editDOBirth: studentData.dOBirth,
                                              editDept: studentData.dept,
                                              editEMail: studentData.eMail,
                                              editParentName:
                                                  studentData.guardianName,
                                              editMobileNum: studentData.mobNum,
                                              index: index,
                                              editPassword:
                                                  studentData.password,
                                              editGender: studentData.gender,
                                              editHouseName:
                                                  studentData.houseName,
                                              editNationality:
                                                  studentData.nationality,
                                              editPlace: studentData.place,
                                              editPost: studentData.postOffice,
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
                                          deleteStudent(index);
                                        },
                                        icon: const Icon(Icons.delete_outline,
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
