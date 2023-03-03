import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../../../constants/fontstyle_constants.dart';

class EditTextField extends StatelessWidget {
  const EditTextField({
    super.key,
    required this.controller,
    required this.textInputType,
    required this.label,
    required this.validator,
    required this.width,
    required this.obscure,
  });
  final TextEditingController controller;
  final TextInputType textInputType;
  final String label;
  final FormFieldValidator<String> validator;
  final bool obscure;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        controller: controller,
        obscureText: obscure,
        keyboardType: textInputType,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          label: Text(
            label,
            style: jAlegrayaSansHeadTextStyle,
          ),
        ),
        validator: validator,
      ),
    );
  }
}
