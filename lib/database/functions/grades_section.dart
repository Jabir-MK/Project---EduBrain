import 'package:edubrain/database/model/grades/grades_model.dart';
import 'package:hive/hive.dart';

const gradestDatabaseName = 'GRADES_DATABASE';
List<GradesModel> gradesList = [];

Future<void> addGrades(GradesModel value) async {
  final grades = await Hive.openBox<GradesModel>(gradestDatabaseName);
  grades.add(value);
}

Future<void> getGrades() async {}
