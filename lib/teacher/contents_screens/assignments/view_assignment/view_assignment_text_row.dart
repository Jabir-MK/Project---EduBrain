import 'package:edubrain/constants/fontstyle_constants.dart';
import 'package:flutter/widgets.dart';

class ViewAssignmentTextRow extends StatelessWidget {
  const ViewAssignmentTextRow({
    super.key,
    required this.detailHead,
    required this.detailValue,
  });
  final String detailHead;
  final String detailValue;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          detailHead,
          style: jAssignmentTextStyle,
        ),
        Text(detailValue)
      ],
    );
  }
}
