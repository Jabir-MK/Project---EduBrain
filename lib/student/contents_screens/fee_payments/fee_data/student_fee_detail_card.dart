import 'package:edubrain/constants/constant.dart';
import 'package:edubrain/constants/fontstyle_constants.dart';
import 'package:flutter/material.dart';

class StudentFeePaymentDetails extends StatelessWidget {
  const StudentFeePaymentDetails({
    super.key,
    required this.detailsTitle,
    required this.detailsStatusValue,
  });

  final String detailsTitle;
  final String detailsStatusValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          detailsTitle,
          style: jFeePaymentDetailsTextStyle,
        ),
        Text(
          detailsStatusValue,
          style: jAlegrayaSansSubTextStyle,
        ),
      ],
    );
  }
}

class StudentFeePaymentButton extends StatelessWidget {
  const StudentFeePaymentButton({
    super.key,
    required this.iconData,
    required this.onPress,
    required this.paymentTitle,
  });
  final String paymentTitle;
  final IconData iconData;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              jSecondaryColor,
              jPrimaryColor,
            ],
            begin: FractionalOffset(0, 0),
            end: FractionalOffset(0.5, 0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(jDefaultPadding),
            bottomRight: Radius.circular(jDefaultPadding),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              paymentTitle,
              style: jKalamLargeStyle,
            ),
            jWidthBox,
            Icon(
              iconData,
              color: jWhiteTextColor,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
