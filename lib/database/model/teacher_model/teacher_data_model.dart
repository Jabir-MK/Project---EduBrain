import 'package:hive/hive.dart';
part 'teacher_data_model.g.dart';

@HiveType(typeId: 3)
class TeacherModel {
  @HiveField(0)
  int? id;
  @HiveField(8)
  final String teacherName;
  @HiveField(1)
  final String teacherRegID;
  @HiveField(2)
  final String teacherSubject;
  @HiveField(3)
  final String teacherQualification;
  @HiveField(4)
  final String teacherGender;
  @HiveField(5)
  final String teacherEMail;
  @HiveField(6)
  final String teacherMobileNum;
  @HiveField(7)
  final String teacherPassword;

  TeacherModel({
    required this.teacherRegID,
    required this.teacherSubject,
    required this.teacherQualification,
    required this.teacherGender,
    required this.teacherMobileNum,
    required this.teacherName,
    required this.teacherEMail,
    required this.teacherPassword,
  });
}
