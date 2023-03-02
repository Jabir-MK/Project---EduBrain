// -------------  Database Teacher  ------------

// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:edubrain/database/model/teacher_model/teacher_data_model.dart';
import 'package:edubrain/view/teacher/login_screen/login_teacher/teacher_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

const teacherModelDatabaseName = 'TEACHER_DATABASE';

ValueNotifier<List<TeacherModel>> teacherModelNotifier = ValueNotifier([]);
List<TeacherModel> teacherProfileList = [];

Future<void> createTeacherProfile(TeacherModel value) async {
  final teacherDatabase =
      await Hive.openBox<TeacherModel>(teacherModelDatabaseName);
  await teacherDatabase.put(value.id, value);
  teacherModelNotifier.value.add(value);
  getTeacherProfile();
  teacherModelNotifier.notifyListeners();
}

Future<void> getTeacherProfile() async {
  final teacherDatabase =
      await Hive.openBox<TeacherModel>(teacherModelDatabaseName);
  teacherModelNotifier.value.clear();
  teacherModelNotifier.value.addAll(teacherDatabase.values);
  teacherModelNotifier.notifyListeners();
}

Future<void> editTeacherProfile(int id, TeacherModel value) async {
  final teacherDatabase =
      await Hive.openBox<TeacherModel>(teacherModelDatabaseName);
  await teacherDatabase.put(value.id, value);
  userTeacher = value;
  teacherModelNotifier.notifyListeners();
  getTeacherProfile();
}
