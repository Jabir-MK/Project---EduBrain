import 'package:edubrain/database/model/assignment/assignment_data_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AssignmentsDBProvider with ChangeNotifier {
  static const assignmentDatabaseName = 'ASSIGNMENT_DATABASE';
  List<AssignmentModel> assignmentList = [];
  Future<void> addAssignment(AssignmentModel value) async {
    final assignmentDatabase =
        await Hive.openBox<AssignmentModel>(assignmentDatabaseName);
    final ids = await assignmentDatabase.add(value);
    value.id = ids;
    assignmentList.add(value);
    getAllAssignments();
    notifyListeners();
  }

  Future<void> deleteAssignment(index) async {
    final assignmentDatabase =
        await Hive.openBox<AssignmentModel>(assignmentDatabaseName);
    await assignmentDatabase.deleteAt(index);
    getAllAssignments();
    notifyListeners();
  }

  Future<void> getAllAssignments() async {
    final assignmentDatabase =
        await Hive.openBox<AssignmentModel>(assignmentDatabaseName);
    assignmentList.clear();
    assignmentList.addAll(assignmentDatabase.values);
    notifyListeners();
  }

  Future<void> editAssignment(int id, AssignmentModel value) async {
    final assignmentDatabase =
        await Hive.openBox<AssignmentModel>(assignmentDatabaseName);
    assignmentDatabase.putAt(id, value);
    getAllAssignments();
    notifyListeners();
  }
}
