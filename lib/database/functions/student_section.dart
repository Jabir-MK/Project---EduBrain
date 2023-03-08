import 'package:edubrain/database/model/student/student_data_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class StudentDBProvider with ChangeNotifier {
  final studentModelDatabaseName = 'STUDENT_DATABASE';
  List<StudentModel> studentListDB = [];

  Future<void> addStudent(StudentModel value) async {
    final studentDB =
        await Hive.openBox<StudentModel>(studentModelDatabaseName);
    final ids = await studentDB.add(value);
    value.id = ids;
    studentListDB.add(value);
    getAllStudents();
    notifyListeners();
  }

  Future<void> getAllStudents() async {
    final studentDB =
        await Hive.openBox<StudentModel>(studentModelDatabaseName);
    studentListDB.clear();
    studentListDB.addAll(studentDB.values.toList());
    notifyListeners();
  }

  Future<void> editStudent(int id, StudentModel value) async {
    final dataBaseStudent =
        await Hive.openBox<StudentModel>(studentModelDatabaseName);
    dataBaseStudent.putAt(id, value);
    getAllStudents();
    notifyListeners();
  }

  Future<void> deleteStudent(index) async {
    final studentDB =
        await Hive.openBox<StudentModel>(studentModelDatabaseName);
    await studentDB.deleteAt(index);
    getAllStudents();
    notifyListeners();
  }
}
