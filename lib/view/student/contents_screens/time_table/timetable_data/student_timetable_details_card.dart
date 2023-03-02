import 'package:flutter/material.dart';

class StudentTimeTableCards extends StatelessWidget {
  const StudentTimeTableCards({
    super.key,
    required this.content,
    required this.contentStyle,
  });

  final String content;
  final TextStyle contentStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: contentStyle,
    );
  }
}
