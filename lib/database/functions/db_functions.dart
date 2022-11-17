// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:edubrain/database/model/student_data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);

abstract class Studentmodel {
  Future<void> addStudent(StudentModel value);
  Future<void> getAllStudents();
  Future<void> deleteStudent(id);
  Future<void> editStudent(StudentModel value);
}

class Studentmod implements Studentmodel {
  @override
  Future<void> addStudent(StudentModel value) async {
    final studentDataBase =
        await Hive.openBox<StudentModel>('student_database');
    await studentDataBase.put(value.id, value);
    studentListNotifier.notifyListeners();
    getAllStudents();
  }

  @override
  Future<void> deleteStudent(index) async {
    final studentDataBase =
        await Hive.openBox<StudentModel>('student_database');
    await studentDataBase.deleteAt(index);
    getAllStudents();
  }

  @override
  Future<void> editStudent(StudentModel value) async {
    final dataBaseStudent =
        await Hive.openBox<StudentModel>('student_database');
    dataBaseStudent.put(value.id, value);
    getAllStudents();
  }

  @override
  Future<void> getAllStudents() async {
    final studentDataBase =
        await Hive.openBox<StudentModel>('student_database');
    studentListNotifier.value.clear();
    studentListNotifier.value.addAll(studentDataBase.values);
    studentListNotifier.notifyListeners();
  }
}
