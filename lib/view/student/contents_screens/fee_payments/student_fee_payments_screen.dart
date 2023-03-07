import 'package:edubrain/core/constants/constant.dart';
import 'package:edubrain/core/constants/fontstyle_constants.dart';
import 'package:edubrain/view/student/contents_screens/fee_payments/controller/controller.dart';
import 'package:edubrain/view/student/contents_screens/fee_payments/fee_data/student_fee_data.dart';
import 'package:edubrain/view/student/contents_screens/fee_payments/widgets/student_fee_detail_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentFeePaymentScreen extends StatelessWidget {
  const StudentFeePaymentScreen({super.key});

  static String routeName = "StudentFeePaymentScreen";

  @override
  Widget build(BuildContext context) {
    final paymentProvider =
        Provider.of<PaymentsProvider>(context, listen: false);
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
                              paymentProvider
                                  .paymentDownloadedSnackbar(context);
                            } else {
                              paymentProvider.confirmPayment(context);
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
}
