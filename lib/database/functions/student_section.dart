// -------------  Database Student  ----------

// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:edubrain/database/model/student/student_data_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

const studentModelDatabaseName = 'STUDENT_DATABASE';
ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);

Future<void> addStudent(StudentModel value) async {
  final studentDB = await Hive.openBox<StudentModel>(studentModelDatabaseName);
  final ids = await studentDB.add(value);
  value.id = ids;
  studentListNotifier.value.add(value);
  studentListNotifier.notifyListeners();
  getAllStudents();
}

Future<void> getAllStudents() async {
  final studentDB = await Hive.openBox<StudentModel>(studentModelDatabaseName);
  studentListNotifier.value.clear();
  studentListNotifier.value.addAll(studentDB.values.toList());
  studentListNotifier.notifyListeners();
}

Future<void> editStudent(int id, StudentModel value) async {
  final dataBaseStudent =
      await Hive.openBox<StudentModel>(studentModelDatabaseName);
  dataBaseStudent.putAt(id, value);
  getAllStudents();
}

Future<void> deleteStudent(index) async {
  final studentDB = await Hive.openBox<StudentModel>(studentModelDatabaseName);
  await studentDB.deleteAt(index);
  getAllStudents();
}
