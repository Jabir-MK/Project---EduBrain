class TeacherAssignmentDataModel {
  final String subjectName;
  final String topicName;
  final String assignedDate;
  final String dueDate;
  final String status;

  TeacherAssignmentDataModel(
    this.subjectName,
    this.topicName,
    this.assignedDate,
    this.dueDate,
    this.status,
  );
}

List<TeacherAssignmentDataModel> teacherAssignment = [
  TeacherAssignmentDataModel('Computer Science', 'Algorithms', '01 Nov 2022',
      '07 Nov 2022', 'Pending'),
  TeacherAssignmentDataModel('Physics', 'Projectile Motion', '23 Sep 2022',
      '30 Sep 2022', 'Submiteed'),
  TeacherAssignmentDataModel(
      'Chemistry', 'Lanthanides', '24 Sep 2022', '29 Sep 2022', 'Submitted'),
  TeacherAssignmentDataModel(
      'Mathematics', 'Integration', '03 Nov 2022', '10 Nov 2022', 'Pending'),
];
