import 'package:edubrain/constants/constant.dart';
import 'package:flutter/material.dart';

class TeacherHomeScreenCards extends StatelessWidget {
  const TeacherHomeScreenCards(
      {super.key,
      required this.onPress,
      required this.iconImage,
      required this.cardTitle});

  final VoidCallback onPress;
  final String iconImage;
  final String cardTitle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.only(top: jDefaultPadding * 1.5),
        width: MediaQuery.of(context).size.width / 2.5,
        height: MediaQuery.of(context).size.height / 6,
        decoration: BoxDecoration(
            color: jPrimaryColor,
            borderRadius: BorderRadius.circular(jDefaultPadding / 1.5),
            boxShadow: const [
              BoxShadow(
                color: jBlackTextColor,
                blurRadius: 10,
              )
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              iconImage,
              height: 80,
              width: 80,
            ),
            Text(
              cardTitle,
              style: const TextStyle(
                  color: jWhiteTextColor,
                  fontFamily: 'AkayaTelivigala',
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            jHalfHeightBox
          ],
        ),
      ),
    );
  }
}
