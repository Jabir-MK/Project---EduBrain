import 'package:edubrain/constants/fontstyle_constants.dart';
import 'package:flutter/material.dart';

class AddStudentColumnFormField extends StatelessWidget {
  const AddStudentColumnFormField({
    super.key,
    required this.controller,
    required this.detailHead,
    required this.validator,
    required this.labelText,
    required this.inputType,
    required this.visibleText,
  });

  final TextEditingController controller;
  final String detailHead;
  final FormFieldValidator validator;
  final String labelText;
  final TextInputType inputType;
  final bool visibleText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          detailHead,
          style: jAlegrayaSansSubTextStyle,
        ),
        SizedBox(
          child: TextFormField(
            obscureText: visibleText,
            validator: validator,
            controller: controller,
            keyboardType: inputType,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              label: Text(
                labelText,
                style: jAlegrayaSansHeadTextStyle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AddStudentRowFormField extends StatelessWidget {
  const AddStudentRowFormField({
    super.key,
    required this.controller,
    required this.detailHead,
    required this.validator,
    required this.labelText,
    required this.inputType,
  });

  final TextEditingController controller;
  final String detailHead;
  final FormFieldValidator validator;
  final String labelText;
  final TextInputType inputType;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          detailHead,
          style: jAlegrayaSansSubTextStyle,
        ),
        SizedBox(
          width: 200,
          child: TextFormField(
            controller: controller,
            keyboardType: inputType,
            decoration: InputDecoration(
                border: const OutlineInputBorder(),
                label: Text(
                  labelText,
                  style: jAlegrayaSansHeadTextStyle,
                )),
            validator: validator,
          ),
        ),
      ],
    );
  }
}
