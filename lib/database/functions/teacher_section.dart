import 'package:edubrain/database/model/teacher_model/teacher_data_model.dart';
import 'package:edubrain/view/teacher/login_screen/login_teacher/teacher_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TeacherDBProvider with ChangeNotifier {
  final teacherModelDatabaseName = 'TEACHER_DATABASE';

  List<TeacherModel> teacherModel = [];
  // List<TeacherModel> teacherProfileList = [];

  Future<void> createTeacherProfile(TeacherModel value) async {
    final teacherDatabase =
        await Hive.openBox<TeacherModel>(teacherModelDatabaseName);
    await teacherDatabase.put(value.id, value);
    teacherModel.add(value);
    getTeacherProfile();
    notifyListeners();
  }

  Future<void> getTeacherProfile() async {
    final teacherDatabase =
        await Hive.openBox<TeacherModel>(teacherModelDatabaseName);
    teacherModel.clear();
    teacherModel.addAll(teacherDatabase.values);
    notifyListeners();
  }

  Future<void> editTeacherProfile(int id, TeacherModel value) async {
    final teacherDatabase =
        await Hive.openBox<TeacherModel>(teacherModelDatabaseName);
    await teacherDatabase.put(value.id, value);
    userTeacher = value;
    notifyListeners();
    getTeacherProfile();
  }
}
