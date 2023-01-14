import 'package:edubrain/database/model/grades/grades_model.dart';
import 'package:hive/hive.dart';
part 'student_data_model.g.dart';

@HiveType(typeId: 1)
class StudentModel {
  @HiveField(0)
  int? id;

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
  final String nationality;

  @HiveField(8)
  final String gender;

  @HiveField(9)
  final String houseName;

  @HiveField(10)
  final String postOffice;

  @HiveField(11)
  final String place;

  @HiveField(12)
  final String eMail;

  @HiveField(13)
  final String guardianName;

  @HiveField(14)
  final String mobNum;

  @HiveField(15)
  final String password;

  @HiveField(16)
  GradesModel? grades;

  StudentModel({
    required this.nationality,
    required this.gender,
    required this.houseName,
    required this.postOffice,
    required this.place,
    required this.password,
    required this.fName,
    required this.lName,
    required this.regNum,
    required this.admNum,
    required this.dOBirth,
    required this.dept,
    required this.eMail,
    required this.mobNum,
    required this.guardianName,
    this.grades,
  });
}
