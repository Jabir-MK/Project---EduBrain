import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/constant.dart';
import '../../../../database/functions/teacher_section.dart';
import '../../../../database/model/teacher_model/teacher_data_model.dart';

class TeacherProfileController with ChangeNotifier {
  TextEditingController teacherNameEditController = TextEditingController();
  TextEditingController teacherRegIDEditController = TextEditingController();
  TextEditingController teacherGenderEditController = TextEditingController();
  TextEditingController teacherQaulEditController = TextEditingController();
  TextEditingController teacherSubjectEditController = TextEditingController();
  TextEditingController teacherEmailEditController = TextEditingController();
  TextEditingController teacherMobileEditController = TextEditingController();
  TextEditingController teacherPasswordEditController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  // =========

  Future<void> editTeacherProfileOnTap(context, index) async {
    final teacherNameEdit = teacherNameEditController.text.trim();
    final teacherRegIDEdit = teacherRegIDEditController.text.trim();
    final teacherGenderEdit = teacherGenderEditController.text.trim();
    final teacherQualificationEdit = teacherQaulEditController.text.trim();
    final teacherSubjectEdit = teacherSubjectEditController.text.trim();
    final teacherEmailEdit = teacherEmailEditController.text.trim();
    final teacherMobileNumEdit = teacherMobileEditController.text.trim();
    final teacherPasswordEdit = teacherPasswordEditController.text.trim();

    if (teacherMobileNumEdit.isEmpty ||
        teacherPasswordEdit.isEmpty ||
        teacherEmailEdit.isEmpty ||
        teacherNameEdit.isEmpty ||
        teacherRegIDEdit.isEmpty ||
        teacherGenderEdit.isEmpty ||
        teacherQualificationEdit.isEmpty ||
        teacherSubjectEdit.isEmpty) {
      return;
    } else {
      final teacherEdit = TeacherModel(
        DateTime.now().millisecond,
        teacherRegID: teacherRegIDEdit,
        teacherSubject: teacherSubjectEdit,
        teacherQualification: teacherQualificationEdit,
        teacherGender: teacherGenderEdit,
        teacherMobileNum: teacherMobileNumEdit,
        teacherName: teacherNameEdit,
        teacherEMail: teacherEmailEdit,
        teacherPassword: teacherPasswordEdit,
      );
      Provider.of<TeacherDBProvider>(context, listen: false)
          .editTeacherProfile(index, teacherEdit);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: jSecondaryColor,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(jDefaultPadding),
          content: Text("Updated Profile Successfully"),
        ),
      );
    }
  }
}
