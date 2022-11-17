import 'package:flutter/material.dart';

class ViewStudentProfile extends StatelessWidget {
  const ViewStudentProfile({super.key});

  static String routeName = 'ViewStudentProfile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Name'),
      ),
    );
  }
}
