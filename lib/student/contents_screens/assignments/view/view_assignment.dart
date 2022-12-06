import 'package:flutter/material.dart';

class StudentViewAssignment extends StatelessWidget {
  const StudentViewAssignment({super.key});
  static String routeName = 'StudentViewAssignmentScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('data'),
      ),
    );
  }
}
