import 'package:edubrain/core/constants/fontstyle_constants.dart';
import 'package:flutter/material.dart';

class TextFormFieldRow extends StatelessWidget {
  const TextFormFieldRow({
    super.key,
    required this.rowTitle,
    required this.controller,
    required this.returnValue,
  });

  final String rowTitle;
  final TextEditingController controller;
  final String returnValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          rowTitle,
          style: jAssignmentTextStyle,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 3,
          child: TextFormField(
            controller: controller,
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return returnValue;
              }
              return null;
            },
          ),
        )
      ],
    );
  }
}
