import 'package:flutter/material.dart';

class AddAssignmentScreen extends StatelessWidget {
  const AddAssignmentScreen({super.key});

  static String routeName = 'AddAssignmentScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Assignment'),
      ),
    );
  }
}
