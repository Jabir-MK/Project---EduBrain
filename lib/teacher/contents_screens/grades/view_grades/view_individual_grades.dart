import 'package:edubrain/constants/constant.dart';
import 'package:edubrain/constants/fontstyle_constants.dart';
import 'package:edubrain/teacher/contents_screens/grades/view_grades/view_individual_grades_details.dart';
import 'package:flutter/material.dart';

class ViewIndividualStudentGradesScreen extends StatefulWidget {
  const ViewIndividualStudentGradesScreen({super.key, required this.index});

  final int index;

  @override
  State<ViewIndividualStudentGradesScreen> createState() =>
      _ViewIndividualStudentGradesScreenState();
}

class _ViewIndividualStudentGradesScreenState
    extends State<ViewIndividualStudentGradesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Student Grade',
          style: jAkayaTelivigalaAppDefaultStyle,
        ),
      ),
      body: ListView(
        children: [
          GestureDetector(
            onTap: () {},
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Name'),
                      Text('Register No.'),
                    ],
                  ),
                  jheightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Admission No'),
                      Text('Department'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              const IndividualGradesProgressIndicator(
                subjectMark: 74,
                subjectName: 'English',
                progressColor: Colors.blue,
              ),
              jheightBox,
              const IndividualGradesProgressIndicator(
                subjectMark: 73,
                subjectName: 'Language',
                progressColor: Colors.red,
              ),
              jheightBox,
              const IndividualGradesProgressIndicator(
                subjectMark: 69,
                subjectName: 'Mathematics',
                progressColor: Colors.green,
              ),
              jheightBox,
              const IndividualGradesProgressIndicator(
                subjectMark: 42,
                subjectName: 'Chemistry',
                progressColor: Colors.purple,
              ),
              jheightBox,
              const IndividualGradesProgressIndicator(
                subjectMark: 53,
                subjectName: 'Physics',
                progressColor: Colors.yellow,
              ),
              jheightBox,
              const IndividualGradesProgressIndicator(
                subjectMark: 54,
                subjectName: 'Computer Science',
                progressColor: Colors.orange,
              ),
              jheightBox,
              ElevatedButton(
                onPressed: () {},
                child: const Text('Submit'),
              ),
            ],
          )
        ],
        // ---------------------The container for basic details of student which currently speculating ---------------------------------
        // -----------------------------------------------------------
        // ValueListenableBuilder(
        //   valueListenable: studentListNotifier,
        //   builder: (BuildContext context, List<StudentModel> studentInfo,
        //       Widget? child) {
        //     return ListView.builder(
        //       itemCount: studentInfo.length,
        //       itemBuilder: (context, index) {
        //         final studentInfoData = studentInfo[index];
        //         return GestureDetector(
        //           onTap: () => ViewStudentProfile(
        //               studentFirstName: studentInfoData.fName,
        //               studentLastName: studentInfoData.lName,
        //               studentRegNo: studentInfoData.regNum,
        //               studentAdmNo: studentInfoData.admNum,
        //               studentDOBirth: studentInfoData.dOBirth,
        //               studentDept: studentInfoData.dept,
        //               studentNationality: studentInfoData.nationality,
        //               studentGender: studentInfoData.gender,
        //               studentHouseName: studentInfoData.houseName,
        //               studentPostOffice: studentInfoData.postOffice,
        //               studentPlace: studentInfoData.place,
        //               studentEMail: studentInfoData.eMail,
        //               studentParentName: studentInfoData.guardianName,
        //               studentMobileNum: studentInfoData.mobNum,
        //               studentPassword: studentInfoData.password),
        // child: Container(
        //   padding: const EdgeInsets.all(jDefaultPadding),
        //   margin: const EdgeInsets.all(jDefaultPadding),
        //   decoration: BoxDecoration(
        //     color: jOtherColor,
        //     borderRadius: BorderRadius.circular(jDefaultPadding),
        //     boxShadow: const [
        //       BoxShadow(
        //         offset: Offset(10, 10),
        //         blurRadius: 10,
        //         blurStyle: BlurStyle.inner,
        //         color: jSecondaryColor,
        //       ),
        //     ],
        //   ),
        //   child: Column(
        //     children: [
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           Text('${studentInfoData.fName} '
        //               '${studentInfoData.lName}'),
        //           Text(studentInfoData.regNum),
        //         ],
        //       ),
        //       jheightBox,
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           Text(studentInfoData.admNum),
        //           Text(studentInfoData.dept),
        //         ],
        //       ),
        //     ],
        //   ),
        //           ),
        //         );
        //       },
        //     );
        //   },
        // )
      ),
    );
  }
}
