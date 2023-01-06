import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:edubrain/constants/constant.dart';
import 'package:flutter/material.dart';

class StudentNameInfo extends StatelessWidget {
  const StudentNameInfo({super.key, required this.studentName});
  final String studentName;
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
        fontFamily: 'Satisfy',
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: jWhiteTextColor,
      ),
      child: AnimatedTextKit(
        animatedTexts: [
          WavyAnimatedText("Hi , $studentName"),
        ],
        totalRepeatCount: 3,
      ),
    );
  }
}

class StudentClassRegisterInfo extends StatelessWidget {
  const StudentClassRegisterInfo(
      {super.key, required this.studentRegisterInfos});

  final String studentRegisterInfos;

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      animatedTexts: [
        TypewriterAnimatedText(
          studentRegisterInfos,
          speed: const Duration(milliseconds: 150),
          textStyle: const TextStyle(
            color: jOtherColor,
            fontFamily: 'ShadowsIntoLight',
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
      totalRepeatCount: 3,
    );
    //  Text(
    //   studentRegisterInfos,
    // style:
    // );
  }
}

class StudentImageInfo extends StatelessWidget {
  const StudentImageInfo(
      {super.key, required this.onPress, required this.studentImageAddress});
  final String studentImageAddress;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius:
              BorderRadius.all(Radius.circular(jDefaultPadding * 1.8)),
          boxShadow: [
            BoxShadow(
              color: jLightTextColor,
              blurRadius: 10,
            )
          ],
        ),
        child: CircleAvatar(
          radius: 40,
          backgroundColor: jWhiteTextColor,
          backgroundImage: AssetImage(studentImageAddress),
        ),
      ),
    );
  }
}

class StudentProgressInfo extends StatelessWidget {
  const StudentProgressInfo(
      {super.key,
      required this.progressValue,
      required this.onPress,
      required this.progressTitle});
  final String progressTitle;
  final String progressValue;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: MediaQuery.of(context).size.width / 2.5,
        height: MediaQuery.of(context).size.height / 8.5,
        decoration: BoxDecoration(
            color: jOtherColor,
            borderRadius: BorderRadius.circular(jDefaultPadding),
            boxShadow: const [
              BoxShadow(
                color: jBlackTextColor,
                blurRadius: 10,
              )
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              progressTitle,
              style: const TextStyle(
                fontFamily: 'AlegreyaSans',
                fontSize: 25,
                color: jBlackTextColor,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              progressValue,
              style: const TextStyle(
                fontFamily: 'Satisfy',
                fontSize: 25,
                color: jBlackTextColor,
                fontWeight: FontWeight.w100,
              ),
            )
          ],
        ),
      ),
    );
  }
}
