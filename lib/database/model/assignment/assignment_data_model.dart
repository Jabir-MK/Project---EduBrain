import 'package:hive/hive.dart';
part 'assignment_data_model.g.dart';

@HiveType(typeId: 2)
class AssignmentModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  final String subjectName;
  @HiveField(2)
  final String topicName;
  @HiveField(3)
  final String assignDate;
  @HiveField(4)
  final String dueDate;
  @HiveField(5)
  final String assignmentContent;

  AssignmentModel({
    required this.assignmentContent,
    required this.subjectName,
    required this.topicName,
    required this.assignDate,
    required this.dueDate,
  });
}
