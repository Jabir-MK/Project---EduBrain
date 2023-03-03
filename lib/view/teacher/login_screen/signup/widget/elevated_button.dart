import 'package:flutter/material.dart';

import '../../../../../core/constants/constant.dart';

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget({
    super.key,
    required this.text,
    required this.onPressAction,
  });

  final String text;
  final VoidCallback onPressAction;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressAction,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(jPrimaryColor),
      ),
      child: Text(
        text,
      ),
    );
  }
}
