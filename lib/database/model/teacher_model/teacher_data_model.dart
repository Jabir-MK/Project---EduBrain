import 'package:hive/hive.dart';
part 'teacher_data_model.g.dart';

@HiveType(typeId: 3)
class TeacherModel {
  @HiveField(0)
  int id;
  @HiveField(1)
  final String teacherName;
  @HiveField(2)
  final String teacherRegID;
  @HiveField(3)
  final String teacherSubject;
  @HiveField(4)
  final String teacherQualification;
  @HiveField(5)
  final String teacherGender;
  @HiveField(6)
  final String teacherEMail;
  @HiveField(7)
  final String teacherMobileNum;
  @HiveField(8)
  final String teacherPassword;

  TeacherModel(
    this.id, {
    required this.teacherRegID,
    required this.teacherSubject,
    required this.teacherQualification,
    required this.teacherGender,
    required this.teacherMobileNum,
    required this.teacherName,
    required this.teacherEMail,
    required this.teacherPassword,
  });

  @override
  String toString() {
    return 'Teacher Model Info\n $teacherName \n $teacherEMail \n $teacherGender \n $teacherMobileNum $teacherPassword \n $teacherQualification \n $teacherRegID \n $teacherSubject \n $id ';
  }
}
