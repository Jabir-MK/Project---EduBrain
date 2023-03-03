import 'package:edubrain/core/constants/constant.dart';
import 'package:edubrain/core/constants/fontstyle_constants.dart';
import 'package:edubrain/database/model/student/student_data_model.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class StudentGradesScreen extends StatefulWidget {
  const StudentGradesScreen({super.key, required this.studentModel});
  static String routeName = 'GradesScreen';
  final StudentModel studentModel;
  @override
  State<StudentGradesScreen> createState() => _StudentGradesScreenState();
}

class _StudentGradesScreenState extends State<StudentGradesScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Grades",
          style: jAkayaTelivigalaAppDefaultStyle,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(5),
        physics: const BouncingScrollPhysics(),
        children: [
          Column(
            children: [
              jheightBox,
              Column(
                children: [
                  const Text(
                    'English',
                    style: jAcmeMediumStyle,
                  ),
                  LinearPercentIndicator(
                      trailing: Text(
                        widget.studentModel.grades!.englishMark.toString(),
                        style: const TextStyle(
                            fontSize: 20,
                            fontFamily: 'Kalam',
                            fontWeight: FontWeight.bold,
                            color: jWhiteTextColor),
                      ),
                      animation: true,
                      animationDuration: 1500,
                      lineHeight: 20,
                      percent: double.parse(
                            widget.studentModel.grades!.englishMark,
                          ) /
                          100,
                      progressColor: const Color.fromRGBO(75, 135, 185, 1),
                      backgroundColor: jPrimaryColor,
                      barRadius: const Radius.circular(jDefaultPadding * 2)),
                ],
              ),
              Column(
                children: [
                  const Text(
                    'Mathematics',
                    style: jAcmeMediumStyle,
                  ),
                  LinearPercentIndicator(
                      trailing: Text(
                        widget.studentModel.grades!.mathematicsMark,
                        style: const TextStyle(
                            fontSize: 20,
                            fontFamily: 'Kalam',
                            fontWeight: FontWeight.bold,
                            color: jWhiteTextColor),
                      ),
                      animation: true,
                      animationDuration: 1500,
                      lineHeight: 20,
                      percent: double.parse(
                            widget.studentModel.grades!.mathematicsMark,
                          ) /
                          100,
                      progressColor: const Color.fromRGBO(192, 108, 132, 1),
                      backgroundColor: jPrimaryColor,
                      barRadius: const Radius.circular(jDefaultPadding * 2)),
                ],
              ),
              Column(
                children: [
                  const Text(
                    'Language',
                    style: jAcmeMediumStyle,
                  ),
                  LinearPercentIndicator(
                      trailing: Text(
                        widget.studentModel.grades!.languageMark,
                        style: const TextStyle(
                            fontSize: 20,
                            fontFamily: 'Kalam',
                            fontWeight: FontWeight.bold,
                            color: jWhiteTextColor),
                      ),
                      animation: true,
                      animationDuration: 1500,
                      lineHeight: 20,
                      percent: double.parse(
                            widget.studentModel.grades!.languageMark,
                          ) /
                          100,
                      progressColor: const Color.fromRGBO(246, 114, 128, 1),
                      backgroundColor: jPrimaryColor,
                      barRadius: const Radius.circular(jDefaultPadding * 2)),
                ],
              ),
              Column(
                children: [
                  const Text(
                    'Chemistry',
                    style: jAcmeMediumStyle,
                  ),
                  LinearPercentIndicator(
                      trailing: Text(
                        widget.studentModel.grades!.chemistryMark,
                        style: const TextStyle(
                            fontSize: 20,
                            fontFamily: 'Kalam',
                            fontWeight: FontWeight.bold,
                            color: jWhiteTextColor),
                      ),
                      animation: true,
                      animationDuration: 1500,
                      lineHeight: 20,
                      percent: double.parse(
                            widget.studentModel.grades!.chemistryMark,
                          ) /
                          100,
                      progressColor: const Color.fromRGBO(248, 177, 149, 1),
                      backgroundColor: jPrimaryColor,
                      barRadius: const Radius.circular(jDefaultPadding * 2)),
                ],
              ),
              Column(
                children: [
                  const Text(
                    'Computer Science',
                    style: jAcmeMediumStyle,
                  ),
                  LinearPercentIndicator(
                      trailing: Text(
                        widget.studentModel.grades!.computerMark,
                        style: const TextStyle(
                            fontSize: 20,
                            fontFamily: 'Kalam',
                            fontWeight: FontWeight.bold,
                            color: jWhiteTextColor),
                      ),
                      animation: true,
                      animationDuration: 1500,
                      lineHeight: 20,
                      percent: double.parse(
                            widget.studentModel.grades!.computerMark,
                          ) /
                          100,
                      progressColor: const Color.fromRGBO(116, 180, 155, 1),
                      backgroundColor: jPrimaryColor,
                      barRadius: const Radius.circular(jDefaultPadding * 2)),
                ],
              ),
              Column(
                children: [
                  const Text(
                    'Physics',
                    style: jAcmeMediumStyle,
                  ),
                  LinearPercentIndicator(
                      trailing: Text(
                        widget.studentModel.grades!.physicsMark,
                        style: const TextStyle(
                            fontSize: 20,
                            fontFamily: 'Kalam',
                            fontWeight: FontWeight.bold,
                            color: jWhiteTextColor),
                      ),
                      animation: true,
                      animationDuration: 1500,
                      lineHeight: 20,
                      percent: double.parse(
                            widget.studentModel.grades!.physicsMark,
                          ) /
                          100,
                      progressColor: const Color.fromRGBO(0, 168, 181, 1),
                      backgroundColor: jPrimaryColor,
                      barRadius: const Radius.circular(jDefaultPadding * 2)),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
