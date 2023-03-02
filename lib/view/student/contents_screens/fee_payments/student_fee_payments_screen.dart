import 'package:edubrain/constants/constant.dart';
import 'package:edubrain/constants/fontstyle_constants.dart';
import 'package:edubrain/view/student/contents_screens/fee_payments/fee_data/student_fee_data.dart';
import 'package:edubrain/view/student/contents_screens/fee_payments/fee_data/student_fee_detail_card.dart';
import 'package:flutter/material.dart';

class StudentFeePaymentScreen extends StatefulWidget {
  const StudentFeePaymentScreen({super.key});

  static String routeName = "StudentFeePaymentScreen";

  @override
  State<StudentFeePaymentScreen> createState() =>
      _StudentFeePaymentScreenState();
}

class _StudentFeePaymentScreenState extends State<StudentFeePaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fee & Paymets',
          style: jAkayaTelivigalaAppDefaultStyle,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: jOtherColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(jDefaultPadding),
                  topRight: Radius.circular(jDefaultPadding),
                ),
              ),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(jDefaultPadding),
                itemCount: feePayment.length,
                itemBuilder: (context, int index) => Container(
                  margin: const EdgeInsets.only(bottom: jDefaultPadding),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(jDefaultPadding),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: jLightTextColor,
                              blurRadius: 2.0,
                            ),
                          ],
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(jDefaultPadding),
                          ),
                        ),
                        child: Column(
                          children: [
                            StudentFeePaymentDetails(
                              detailsTitle: "Reciept No.",
                              detailsStatusValue: feePayment[index].recieptNo,
                            ),
                            const SizedBox(
                              height: jDefaultPadding,
                              child: Divider(
                                thickness: 1.0,
                              ),
                            ),
                            StudentFeePaymentDetails(
                              detailsTitle: "Month",
                              detailsStatusValue: feePayment[index].month,
                            ),
                            jheightBox,
                            StudentFeePaymentDetails(
                              detailsTitle: "Date of Payment",
                              detailsStatusValue: feePayment[index].date,
                            ),
                            jheightBox,
                            StudentFeePaymentDetails(
                              detailsTitle: "Payment Status",
                              detailsStatusValue:
                                  feePayment[index].paymentStatus,
                            ),
                            const SizedBox(
                              height: jDefaultPadding,
                              child: Divider(
                                thickness: 1.0,
                              ),
                            ),
                            StudentFeePaymentDetails(
                              detailsTitle: "Total Amount",
                              detailsStatusValue: feePayment[index].totalAmount,
                            ),
                          ],
                        ),
                      ),
                      StudentFeePaymentButton(
                          iconData: feePayment[index].paymentStatus == 'Paid'
                              ? Icons.download
                              : Icons.arrow_forward,
                          onPress: () {
                            if (feePayment[index].paymentStatus == 'Paid') {
                              paymentDownloadedSnackbar();
                            } else {
                              confirmPayment();
                            }
                          },
                          paymentTitle: feePayment[index].btnStatus)
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void confirmPayment() async {
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
                paymentConfirmedSnackbar();
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

  void paymentConfirmedSnackbar() async {
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

  void paymentDownloadedSnackbar() async {
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
