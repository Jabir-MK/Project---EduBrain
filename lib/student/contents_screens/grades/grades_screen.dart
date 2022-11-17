import 'package:edubrain/constants/constant.dart';
import 'package:edubrain/constants/fontstyle_constants.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StudentGradesScreen extends StatefulWidget {
  const StudentGradesScreen({super.key});
  static String routeName = 'GradesScreen';

  @override
  State<StudentGradesScreen> createState() => _StudentGradesScreenState();
}

class _StudentGradesScreenState extends State<StudentGradesScreen> {
  late List<GradesSubject> _markData;
  late TooltipBehavior _tooltipBehavior;
  @override
  void initState() {
    _markData = getMarkData();
    _tooltipBehavior = TooltipBehavior(
        enable: true,
        color: jPrimaryColor,
        elevation: 10,
        textStyle: const TextStyle(
          fontFamily: 'Kalam',
          fontSize: 15,
        ));
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
              SfCircularChart(
                legend: Legend(
                  textStyle: const TextStyle(
                      fontSize: 17,
                      fontFamily: 'Kalam',
                      color: jWhiteTextColor),
                  position: LegendPosition.bottom,
                  isVisible: true,
                  overflowMode: LegendItemOverflowMode.wrap,
                ),
                tooltipBehavior: _tooltipBehavior,
                series: <CircularSeries>[
                  DoughnutSeries<GradesSubject, String>(
                    radius: '100',
                    dataSource: _markData,
                    xValueMapper: (GradesSubject data, _) => data.subjectName,
                    yValueMapper: (GradesSubject data, _) => data.subjectMark,
                    dataLabelSettings: const DataLabelSettings(
                      textStyle: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Kalam',
                        fontWeight: FontWeight.bold,
                        color: jWhiteTextColor,
                      ),
                      isVisible: true,
                    ),
                    enableTooltip: true,
                  )
                ],
              ),
              jheightBox,
              Column(
                children: [
                  const Text(
                    'English',
                    style: jAcmeMediumStyle,
                  ),
                  LinearPercentIndicator(
                      trailing: const Text(
                        '74',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Kalam',
                            fontWeight: FontWeight.bold,
                            color: jWhiteTextColor),
                      ),
                      animation: true,
                      animationDuration: 1500,
                      lineHeight: 20,
                      percent: 0.74,
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
                      trailing: const Text(
                        '69',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Kalam',
                            fontWeight: FontWeight.bold,
                            color: jWhiteTextColor),
                      ),
                      animation: true,
                      animationDuration: 1500,
                      lineHeight: 20,
                      percent: 0.69,
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
                      trailing: const Text(
                        '77',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Kalam',
                            fontWeight: FontWeight.bold,
                            color: jWhiteTextColor),
                      ),
                      animation: true,
                      animationDuration: 1500,
                      lineHeight: 20,
                      percent: 0.77,
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
                      trailing: const Text(
                        '43',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Kalam',
                            fontWeight: FontWeight.bold,
                            color: jWhiteTextColor),
                      ),
                      animation: true,
                      animationDuration: 1500,
                      lineHeight: 20,
                      percent: 0.43,
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
                      trailing: const Text(
                        '49',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Kalam',
                            fontWeight: FontWeight.bold,
                            color: jWhiteTextColor),
                      ),
                      animation: true,
                      animationDuration: 1500,
                      lineHeight: 20,
                      percent: 0.49,
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
                      trailing: const Text(
                        '33',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Kalam',
                            fontWeight: FontWeight.bold,
                            color: jWhiteTextColor),
                      ),
                      animation: true,
                      animationDuration: 1500,
                      lineHeight: 20,
                      percent: 0.33,
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

  List<GradesSubject> getMarkData() {
    List<GradesSubject> markData = [
      GradesSubject('English', 74),
      GradesSubject('Mathematics', 69),
      GradesSubject('Language', 77),
      GradesSubject('Chemistry', 43),
      GradesSubject('Computer Science', 49),
      GradesSubject('Physics', 33),
    ];
    return markData;
  }
}

class GradesSubject {
  final String subjectName;
  final int subjectMark;

  GradesSubject(this.subjectName, this.subjectMark);
}
