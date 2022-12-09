// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'dart:developer';

import 'package:edubrain/database/model/assignment/assignment_data_model.dart';
import 'package:edubrain/database/model/student/student_data_model.dart';
import 'package:edubrain/database/model/teacher_model/teacher_data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';

// -------------  Database Teacher  ------------

ValueNotifier<List<TeacherModel>> teacherModelNotifier = ValueNotifier([]);

Future<void> createTeacherProfile(TeacherModel value) async {
  final teacherDatabase = await Hive.openBox<TeacherModel>('teacher_database');
  final ids = await teacherDatabase.add(value);
  value.id = ids;
  teacherModelNotifier.value.add(value);
  teacherModelNotifier.notifyListeners();
  log(teacherDatabase.values.toString());
  getTeacherProfile();
  log(value.teacherName);
  log(value.teacherEMail);
  log(value.teacherName);
  log(value.teacherName);
  log(value.teacherName);
}

Future<void> getTeacherProfile() async {
  final teacherDatabase = await Hive.openBox<TeacherModel>('teacherDatabase');
  teacherModelNotifier.value.clear();
  teacherModelNotifier.value.addAll(teacherDatabase.values);
  teacherModelNotifier.notifyListeners();
  log('Test TeacherName ${teacherDatabase.values.first.teacherName}');
}

Future<void> editTeacherProfile(int id, TeacherModel value) async {
  final teacherDatabase = await Hive.openBox<TeacherModel>('teacherDatabase');
  teacherDatabase.putAt(id, value);
  getTeacherProfile();
}

// -------------  Database Student  ----------
ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);

Future<void> addStudent(StudentModel value) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  final ids = await studentDB.add(value);
  value.id = ids;
  studentListNotifier.value.add(value);
  studentListNotifier.notifyListeners();
  getAllStudents();
}

Future<void> getAllStudents() async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  studentListNotifier.value.clear();
  studentListNotifier.value.addAll(studentDB.values);
  studentListNotifier.notifyListeners();
}

Future<void> editStudent(int id, StudentModel value) async {
  final dataBaseStudent = await Hive.openBox<StudentModel>('student_db');
  dataBaseStudent.putAt(id, value);
  getAllStudents();
}

Future<void> deleteStudent(index) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  await studentDB.deleteAt(index);
  getAllStudents();
}

// ---------- Database Assignments  ------------

ValueNotifier<List<AssignmentModel>> assignmentListNotifier = ValueNotifier([]);
Future<void> addAssignment(AssignmentModel value) async {
  final assignmentDatabase =
      await Hive.openBox<AssignmentModel>('assignment_database');
  final ids = await assignmentDatabase.add(value);
  value.id = ids;
  assignmentListNotifier.value.add(value);
  assignmentListNotifier.notifyListeners();
  getAllAssignments();
}

Future<void> deleteAssignment(index) async {
  final assignmentDatabase =
      await Hive.openBox<AssignmentModel>('assignment_database');
  await assignmentDatabase.deleteAt(index);
  getAllAssignments();
}

Future<void> getAllAssignments() async {
  final assignmentDatabase =
      await Hive.openBox<AssignmentModel>('assignment_database');
  assignmentListNotifier.value.clear();
  assignmentListNotifier.value.addAll(assignmentDatabase.values);
  assignmentListNotifier.notifyListeners();
}

Future<void> editAssignment(int id, AssignmentModel value) async {
  final assignmentDatabase =
      await Hive.openBox<AssignmentModel>('assignment_database');
  assignmentDatabase.putAt(id, value);
  getAllAssignments();
}
