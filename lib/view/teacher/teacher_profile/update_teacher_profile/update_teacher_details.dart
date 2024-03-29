import 'package:edubrain/core/constants/constant.dart';
import 'package:edubrain/core/constants/fontstyle_constants.dart';
import 'package:flutter/material.dart';

class EditTeacherProfileBasicIDInfo extends StatelessWidget {
  const EditTeacherProfileBasicIDInfo({
    super.key,
    required this.detailNameValue,
    required this.detailSubjectValue,
    required this.detailRegIDValue,
  });
  final String detailNameValue;
  final String detailSubjectValue;
  final String detailRegIDValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
      decoration: const BoxDecoration(
        color: jPrimaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(jDefaultPadding * 3.5),
          bottomRight: Radius.circular(jDefaultPadding * 3.5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            minRadius: 50,
            maxRadius: 50,
            backgroundColor: jSecondaryColor,
            backgroundImage: AssetImage('assets/images/teacher.png'),
          ),
          jWidthBox,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    detailNameValue,
                    style: jKalamLargeStyle,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    detailSubjectValue,
                    style: jAcmeMediumStyle,
                  ),
                  const Text(
                    '   |   ',
                    style: jAcmeMediumStyle,
                  ),
                  Text(
                    detailRegIDValue,
                    style: jAcmeMediumStyle,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class EditTeacherProfileBasicDetails extends StatelessWidget {
  const EditTeacherProfileBasicDetails(
      {super.key, required this.detailTitle, required this.detailValue});
  final String detailTitle;
  final String detailValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          right: jDefaultPadding / 2,
          left: jDefaultPadding / 4,
          top: jDefaultPadding / 2),
      width: MediaQuery.of(context).size.width / 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                detailTitle,
                style: jAlegrayaSansHeadTextStyle,
              ),
              jHalfHeightBox,
              Text(
                detailValue,
                style: jAlegrayaSansSubTextStyle,
              ),
              jHalfHeightBox,
              SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                child: jDefaultDivider,
              )
            ],
          ),
          const Icon(
            Icons.lock_outline,
            size: 25,
          )
        ],
      ),
    );
  }
}

class EditTeacherProfileContactDetails extends StatelessWidget {
  const EditTeacherProfileContactDetails(
      {super.key, required this.detailsTitle, required this.detailsValue});
  final String detailsTitle;
  final String detailsValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              detailsTitle,
              style: jAlegrayaSansHeadTextStyle,
            ),
            jheightBox,
            Text(
              detailsValue,
              style: jAlegrayaSansSubTextStyle,
            ),
            jHalfHeightBox,
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.1,
              child: jDefaultDivider,
            )
          ],
        ),
        const Icon(
          Icons.lock_outline,
          size: 25,
        )
      ],
    );
  }
}
