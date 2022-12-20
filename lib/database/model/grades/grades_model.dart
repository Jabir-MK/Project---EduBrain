import 'package:hive/hive.dart';
part 'grades_model.g.dart';

@HiveType(typeId: 4)
class GradesModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  final String englishMark;
  @HiveField(2)
  final String mathematicsMark;
  @HiveField(3)
  final String languageMark;
  @HiveField(4)
  final String chemistryMark;
  @HiveField(5)
  final String physicsMark;
  @HiveField(6)
  final String computerMark;
  // student id required

  GradesModel({
    required this.englishMark,
    required this.mathematicsMark,
    required this.languageMark,
    required this.chemistryMark,
    required this.physicsMark,
    required this.computerMark,
  });
}
