import 'package:edubrain/core/constants/constant.dart';
import 'package:edubrain/core/constants/fontstyle_constants.dart';
import 'package:flutter/material.dart';

class PaymentsProvider with ChangeNotifier {
  void confirmPayment(context) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: jSecondaryColor,
          title: const Text(
            'Confirm Payment',
            style: jAlertDialogTitleStyle,
          ),
          content: const Text(
            'Do you want to pay now ?',
            style: jAlertDialogContentStyle,
          ),
          actions: [
            MaterialButton(
              onPressed: () {
                paymentConfirmedSnackbar(context);
              },
              child: const Text(
                'Pay Now',
                style: jAlertDialogConfirmButtonStyle,
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Cancel',
                style: jAlertDialogCancelButtonStyle,
              ),
            )
          ],
        );
      },
    );
  }

  void paymentConfirmedSnackbar(context) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: jSecondaryColor,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(jDefaultPadding),
        padding: const EdgeInsets.all(jDefaultPadding / 2),
        elevation: jDefaultPadding,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Payment Successfull',
              style: jSnackBarTextStyle,
            ),
            Icon(
              Icons.check_circle_outline_outlined,
              color: jWhiteTextColor,
            )
          ],
        ),
      ),
    );
    Navigator.pop(context);
  }

  void paymentDownloadedSnackbar(context) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: jSecondaryColor,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(jDefaultPadding),
        padding: const EdgeInsets.all(jDefaultPadding / 2),
        elevation: jDefaultPadding,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Payment details downloaded',
              style: jSnackBarTextStyle,
            ),
            Icon(
              Icons.check_circle_outline_outlined,
              color: jWhiteTextColor,
            )
          ],
        ),
      ),
    );
  }
}
