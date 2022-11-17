class StudentFeeDataModel {
  final String recieptNo;
  final String month;
  final String date;
  final String paymentStatus;
  final String totalAmount;
  final String btnStatus;

  StudentFeeDataModel(
    this.recieptNo,
    this.month,
    this.date,
    this.paymentStatus,
    this.totalAmount,
    this.btnStatus,
  );
}

List<StudentFeeDataModel> feePayment = [
  StudentFeeDataModel(
      '010100', 'November', '10 Nov 2022', 'Pending', '3500', 'PAY NOW'),
  StudentFeeDataModel(
      '010101', 'September', '04 Sep 2022', 'Paid', '650', 'DOWNLOAD'),
  StudentFeeDataModel(
      '010102', 'August', '01 Aug 2022', 'Paid', '1200', 'DOWNLOAD'),
];
