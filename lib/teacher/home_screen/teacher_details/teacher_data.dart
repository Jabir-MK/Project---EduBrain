import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:edubrain/constants/constant.dart';
import 'package:flutter/material.dart';

class TeacherNameInfo extends StatelessWidget {
  const TeacherNameInfo({super.key, required this.teacherName});
  final String teacherName;
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
        fontFamily: 'Satisfy',
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: jOtherColor,
      ),
      child: AnimatedTextKit(
        animatedTexts: [
          WavyAnimatedText("Hi , $teacherName"),
        ],
        totalRepeatCount: 3,
      ),
    );
  }
}

class TeacherRegisterInfo extends StatelessWidget {
  const TeacherRegisterInfo({
    super.key,
    required this.teacherSubject,
    required this.teacherID,
  });

  final String teacherSubject;
  final String teacherID;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          teacherSubject,
          style: const TextStyle(
            color: jOtherColor,
            fontFamily: 'ShadowsIntoLight',
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Text(
          ' | ',
          style: TextStyle(
            color: jOtherColor,
            fontSize: 40,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          teacherID,
          style: const TextStyle(
            color: jOtherColor,
            fontFamily: 'ShadowsIntoLight',
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}

class TeacherImageInfo extends StatelessWidget {
  const TeacherImageInfo(
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
          minRadius: 50,
          maxRadius: 50,
          backgroundColor: jWhiteTextColor,
          backgroundImage: AssetImage(studentImageAddress),
        ),
      ),
    );
  }
}

class TeacherProgressInfo extends StatelessWidget {
  const TeacherProgressInfo(
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
        height: MediaQuery.of(context).size.height / 9,
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
