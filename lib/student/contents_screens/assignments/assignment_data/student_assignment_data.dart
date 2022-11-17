class StudentAssignmentDataModel {
  final String subjectName;
  final String topicName;
  final String assignedDate;
  final String dueDate;
  final String status;

  StudentAssignmentDataModel(
    this.subjectName,
    this.topicName,
    this.assignedDate,
    this.dueDate,
    this.status,
  );
}

List<StudentAssignmentDataModel> assignment = [
  StudentAssignmentDataModel('Computer Science', 'Algorithms', '01 Nov 2022',
      '07 Nov 2022', 'Pending'),
  StudentAssignmentDataModel('Physics', 'Projectile Motion', '23 Sep 2022',
      '30 Sep 2022', 'Submiteed'),
  StudentAssignmentDataModel(
      'Chemistry', 'Lanthanides', '24 Sep 2022', '29 Sep 2022', 'Submitted'),
  StudentAssignmentDataModel(
      'Mathematics', 'Integration', '03 Nov 2022', '10 Nov 2022', 'Pending'),
];
