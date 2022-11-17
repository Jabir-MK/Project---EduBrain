import 'package:hive/hive.dart';
part 'student_data_model.g.dart';

@HiveType(typeId: 1)
class StudentModel {
  @HiveField(0)
  String? id;

  @HiveField(1)
  final String fName;

  @HiveField(2)
  final String lName;

  @HiveField(3)
  final String regNum;

  @HiveField(4)
  final String admNum;

  @HiveField(5)
  final String dOBirth;

  @HiveField(6)
  final String dept;

  @HiveField(7)
  final String eMail;

  @HiveField(8)
  final String mobNum;

  @HiveField(9)
  final String guardianName;

  StudentModel({
    required this.fName,
    required this.lName,
    required this.regNum,
    required this.admNum,
    required this.dOBirth,
    required this.dept,
    required this.eMail,
    required this.mobNum,
    required this.guardianName,
  });
}
