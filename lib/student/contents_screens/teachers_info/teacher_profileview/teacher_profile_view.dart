import 'package:edubrain/constants/constant.dart';
import 'package:flutter/material.dart';

class ViewTeacherProfile extends StatelessWidget {
  const ViewTeacherProfile({super.key});

  static String routeName = 'ViewTeacherProfile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Subject Name"),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: jWhiteTextColor,
          borderRadius: BorderRadius.circular(jDefaultPadding),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('assets/images/teacher.png'),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('name'),
                Text('full name here'),
              ],
            ),
            Column(
              children: const [
                Text('subject'),
                Text('tutoring subject here'),
              ],
            ),
            const Text('contact info'),
            Column(
              children: const [
                Text('mobile number'),
                Text('mobile number here'),
              ],
            ),
            Column(
              children: const [
                Text('email'),
                Text('email here'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
