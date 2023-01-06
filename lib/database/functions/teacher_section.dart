// -------------  Database Teacher  ------------

// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'dart:developer';

import 'package:edubrain/database/model/teacher_model/teacher_data_model.dart';
import 'package:edubrain/teacher/login_screen/login_teacher/teacher_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

const teacherModelDatabaseName = 'TEACHER_DATABASE';

ValueNotifier<List<TeacherModel>> teacherModelNotifier = ValueNotifier([]);
List<TeacherModel> teacherProfileList = [];

Future<void> createTeacherProfile(TeacherModel value) async {
  final teacherDatabase =
      await Hive.openBox<TeacherModel>(teacherModelDatabaseName);
  final ids = await teacherDatabase.add(value);
  value.id = ids;
  teacherModelNotifier.value.add(value);
  getTeacherProfile();
  teacherModelNotifier.notifyListeners();
}

Future<void> getTeacherProfile() async {
  final teacherDatabase =
      await Hive.openBox<TeacherModel>(teacherModelDatabaseName);
  teacherModelNotifier.value.clear();
  // teacherDatabase.values.toList();
  teacherModelNotifier.value.addAll(teacherDatabase.values);
  teacherProfileList.addAll(teacherDatabase.values);
  currentLoggedTeacher.addAll(teacherDatabase.values);
  teacherModelNotifier.notifyListeners();
}

Future<void> editTeacherProfile(int id, TeacherModel value) async {
  log('Checking at the databaseFunction for values are coming or not');
  log(value.teacherMobileNum, name: 'mobilenum in Edit function');
  final teacherDatabase =
      await Hive.openBox<TeacherModel>(teacherModelDatabaseName);
  teacherDatabase.putAt(id, value);
  teacherProfileList.addAll(teacherDatabase.values);
  currentLoggedTeacher.clear();
  log(currentLoggedTeacher.toList().toString());
  // currentLoggedTeacher.add(value);
  // log('Checking after adding to database and the list');
  // log(currentLoggedTeacher[0].teacherMobileNum,
  //     name: 'mobile after adding by Edit function');
  // log(currentLoggedTeacher[0].teacherQualification,
  //     name: 'qaul after adding by Edit function');
  // log(currentLoggedTeacher[0].teacherName,
  //     name: 'Name after adding by Edit function');
  getTeacherProfile();
}
