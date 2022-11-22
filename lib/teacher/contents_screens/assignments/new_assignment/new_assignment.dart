import 'package:edubrain/constants/attendance/style_attendance.dart';
import 'package:edubrain/constants/constant.dart';
import 'package:edubrain/constants/fontstyle_constants.dart';
import 'package:edubrain/constants/timetable/styles_timetable.dart';
import 'package:flutter/material.dart';

class AddAssignmentScreen extends StatelessWidget {
  const AddAssignmentScreen({super.key});

  static String routeName = 'AddAssignmentScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Assignment',
          style: jAkayaTelivigalaAppDefaultStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(jDefaultPadding / 2),
        child: Container(
          padding: const EdgeInsets.all(jDefaultPadding / 2),
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: jSecondaryColor,
            borderRadius: BorderRadius.circular(jDefaultPadding),
            boxShadow: const [
              BoxShadow(
                color: jWhiteTextColor,
                blurRadius: 5,
                offset: Offset(5, 5),
              )
            ],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Subject',
                    style: jTimeTableSubjectTextStyle,
                  ),
                  SizedBox(
                    width: 200,
                    child: TextFormField(),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Topic',
                    style: jTimeTableSubjectTextStyle,
                  ),
                  SizedBox(
                    width: 200,
                    child: TextFormField(),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Assigned Date',
                    style: jTimeTableSubjectTextStyle,
                  ),
                  Text(
                    '12 Nov 2022',
                    style: jAttendanceHeadingAcmeTextStyle,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Last Date',
                    style: jTimeTableSubjectTextStyle,
                  ),
                  Text(
                    '18 Nov 2022',
                    style: jAttendanceHeadingAcmeTextStyle,
                  ),
                ],
              ),
              jDefaultDivider,
              const Text(
                'Content Details',
                style: jTimeTableSubjectTextStyle,
              ),
              const TextField(
                maxLines: 10,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: jPrimaryColor,
        child: const Icon(
          Icons.add,
          size: 45,
        ),
      ),
    );
  }
}
