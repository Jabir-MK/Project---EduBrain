import 'package:edubrain/core/constants/constant.dart';
import 'package:edubrain/database/functions/teacher_section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../database/model/teacher_model/teacher_data_model.dart';
import '../signup_success.dart';

class TeacherSignUpProvider with ChangeNotifier {
  /* Signup Section Teacher */

  final TextEditingController signUpUserNameController =
      TextEditingController();
  final TextEditingController signUpEmailController = TextEditingController();
  final TextEditingController signUpPasswordController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  // Signup function

  Future<void> signUpTeacherOnTap(context) async {
    final signUpUserNameTeacher = signUpUserNameController.text.trim();
    final signUpEMailTeacher = signUpEmailController.text.trim();
    final signUpPasswordTeacher = signUpPasswordController.text.trim();
    if (signUpUserNameTeacher.isEmpty ||
        signUpEMailTeacher.isEmpty ||
        signUpPasswordTeacher.isEmpty) {
      return;
    } else {
      // --------------------------------
      final teacher = TeacherModel(
        DateTime.now().millisecond,
        teacherRegID: '',
        teacherSubject: '',
        teacherQualification: '',
        teacherGender: '',
        teacherMobileNum: '',
        teacherName: signUpUserNameTeacher,
        teacherEMail: signUpEMailTeacher,
        teacherPassword: signUpPasswordTeacher,
      );
      Provider.of<TeacherDBProvider>(context, listen: false)
          .createTeacherProfile(teacher);

      // -------------------------------

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: jSecondaryColor,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(jDefaultPadding),
          content: Text('Account has been created'),
        ),
      );
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const SignUpSuccess(),
      ),
    );
  }
}
