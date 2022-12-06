import 'package:edubrain/constants/constant.dart';
import 'package:edubrain/constants/fontstyle_constants.dart';
import 'package:flutter/material.dart';

class ViewStudentBasicDetails extends StatelessWidget {
  const ViewStudentBasicDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          right: jDefaultPadding / 2,
          left: jDefaultPadding / 4,
          top: jDefaultPadding / 2),
      width: MediaQuery.of(context).size.width / 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'detailTitle',
                style: jAlegrayaSansHeadTextStyle,
              ),
              jHalfHeightBox,
              const Text(
                'detailValue',
                style: jAlegrayaSansSubTextStyle,
              ),
              jHalfHeightBox,
              SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                child: jDefaultDivider,
              )
            ],
          ),
          const Icon(
            Icons.lock_outline,
            size: 25,
          )
        ],
      ),
    );
  }
}
