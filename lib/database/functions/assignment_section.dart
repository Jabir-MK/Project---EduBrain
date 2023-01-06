// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

// ---------- Database Assignments  ------------
import 'package:edubrain/database/model/assignment/assignment_data_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

const assignmentDatabaseName = 'ASSIGNMENT_DATABASE';
ValueNotifier<List<AssignmentModel>> assignmentListNotifier = ValueNotifier([]);
Future<void> addAssignment(AssignmentModel value) async {
  final assignmentDatabase =
      await Hive.openBox<AssignmentModel>(assignmentDatabaseName);
  final ids = await assignmentDatabase.add(value);
  value.id = ids;
  assignmentListNotifier.value.add(value);
  assignmentListNotifier.notifyListeners();
  getAllAssignments();
}

Future<void> deleteAssignment(index) async {
  final assignmentDatabase =
      await Hive.openBox<AssignmentModel>(assignmentDatabaseName);
  await assignmentDatabase.deleteAt(index);
  getAllAssignments();
}

Future<void> getAllAssignments() async {
  final assignmentDatabase =
      await Hive.openBox<AssignmentModel>(assignmentDatabaseName);
  assignmentListNotifier.value.clear();
  assignmentListNotifier.value.addAll(assignmentDatabase.values);
  assignmentListNotifier.notifyListeners();
}

Future<void> editAssignment(int id, AssignmentModel value) async {
  final assignmentDatabase =
      await Hive.openBox<AssignmentModel>(assignmentDatabaseName);
  assignmentDatabase.putAt(id, value);
  getAllAssignments();
}
