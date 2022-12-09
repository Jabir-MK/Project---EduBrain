import 'package:edubrain/constants/constant.dart';
import 'package:edubrain/constants/fontstyle_constants.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class IndividualGradesProgressIndicator extends StatelessWidget {
  const IndividualGradesProgressIndicator(
      {super.key,
      required this.subjectName,
      required this.subjectMark,
      required this.progressColor});
  final String subjectName;
  final int subjectMark;
  final Color progressColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Add Grades'),
              content: TextFormField(),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: jSecondaryColor,
                        behavior: SnackBarBehavior.floating,
                        margin: EdgeInsets.all(jDefaultPadding),
                        content: Text("Updated Grade Successfully"),
                      ),
                    );
                    Navigator.pop(context);
                  },
                  child: const Text('Add'),
                ),
              ],
            );
          },
        );
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(jDefaultPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  subjectName,
                  style: jAcmeMediumStyle,
                ),
                const Icon(
                  Icons.edit,
                  color: jWhiteTextColor,
                )
              ],
            ),
          ),
          LinearPercentIndicator(
              trailing: Text(
                subjectMark.toString(),
                style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'Kalam',
                    fontWeight: FontWeight.bold,
                    color: jWhiteTextColor),
              ),
              animation: true,
              animationDuration: 1500,
              lineHeight: 20,
              percent: subjectMark / 100,
              progressColor: progressColor,
              backgroundColor: jPrimaryColor,
              barRadius: const Radius.circular(jDefaultPadding * 2)),
        ],
      ),
    );
  }
}
