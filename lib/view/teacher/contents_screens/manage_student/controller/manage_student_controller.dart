import 'package:edubrain/core/constants/constant.dart';
import 'package:edubrain/database/functions/student_section.dart';
import 'package:edubrain/database/model/grades/grades_model.dart';
import 'package:edubrain/database/model/student/student_data_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ManageStudentsController with ChangeNotifier {
  // Add Student Details

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController regNoController = TextEditingController();
  final TextEditingController admNoController = TextEditingController();
  final TextEditingController dOBirthController = TextEditingController();
  final TextEditingController deptController = TextEditingController();
  final TextEditingController nationalityController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController houseNameController = TextEditingController();
  final TextEditingController postOfficeController = TextEditingController();
  final TextEditingController placeController = TextEditingController();
  final TextEditingController eMailController = TextEditingController();
  final TextEditingController parentNameController = TextEditingController();
  final TextEditingController mobileNumController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  // ========

  void clearController() {
    firstNameController.clear();
    lastNameController.clear();
    regNoController.clear();
    admNoController.clear();
    dOBirthController.clear();
    deptController.clear();
    nationalityController.clear();
    genderController.clear();
    houseNameController.clear();
    postOfficeController.clear();
    placeController.clear();
    eMailController.clear();
    parentNameController.clear();
    mobileNumController.clear();
    passController.clear();
  }

  Future<void> addStudentOnTap(context) async {
    final firstName = firstNameController.text.trim();
    final lastName = lastNameController.text.trim();
    final registerNum = regNoController.text.trim();
    final admissionNum = admNoController.text.trim();
    final dateOfBirth = dOBirthController.text.trim();
    final department = deptController.text.trim();
    final parentName = parentNameController.text.trim();
    final mobileNumber = mobileNumController.text.trim();
    final eMailAddress = eMailController.text.trim();
    final pword = passController.text.trim();
    final nationalilty = nationalityController.text.trim();
    final gender = genderController.text.trim();
    final houseName = houseNameController.text.trim();
    final postOffice = postOfficeController.text.trim();
    final place = placeController.text.trim();

    if (firstName.isEmpty ||
        lastName.isEmpty ||
        registerNum.isEmpty ||
        admissionNum.isEmpty ||
        dateOfBirth.isEmpty ||
        department.isEmpty ||
        parentName.isEmpty ||
        mobileNumber.isEmpty ||
        eMailAddress.isEmpty ||
        pword.isEmpty ||
        nationalilty.isEmpty ||
        postOffice.isEmpty ||
        place.isEmpty ||
        gender.isEmpty ||
        houseName.isEmpty) {
      return;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: jSecondaryColor,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(jDefaultPadding),
          content: Text('Added Student Successfully'),
        ),
      );
    }
    final grades = GradesModel(
        englishMark: '0',
        mathematicsMark: '0',
        languageMark: '0',
        chemistryMark: '0',
        physicsMark: '0',
        computerMark: '0');
    final student = StudentModel(
      fName: firstName,
      lName: lastName,
      regNum: registerNum,
      admNum: admissionNum,
      dOBirth: dateOfBirth,
      dept: department,
      eMail: eMailAddress,
      mobNum: mobileNumber,
      guardianName: parentName,
      password: pword,
      gender: gender,
      houseName: houseName,
      nationality: nationalilty,
      place: place,
      postOffice: postOffice,
      grades: grades,
    );
    Provider.of<StudentDBProvider>(context, listen: false).addStudent(student);
    Navigator.of(context).pop();
    clearController();
  }

  // Edit Student Details

  TextEditingController editFirstNameController = TextEditingController();
  TextEditingController editLastNameController = TextEditingController();
  TextEditingController editRegNoController = TextEditingController();
  TextEditingController editAdmNoController = TextEditingController();
  TextEditingController editDOBirthController = TextEditingController();
  TextEditingController editDeptController = TextEditingController();
  TextEditingController editNationalityController = TextEditingController();
  TextEditingController editPostOfficeController = TextEditingController();
  TextEditingController editPlaceController = TextEditingController();
  TextEditingController editHouseNameController = TextEditingController();
  TextEditingController editGenderController = TextEditingController();
  TextEditingController editEMailController = TextEditingController();
  TextEditingController editParentNameController = TextEditingController();
  TextEditingController editMobileNumController = TextEditingController();
  TextEditingController editPasswordController = TextEditingController();

  final editFormKey = GlobalKey<FormState>();

  // ========

  Future<void> editStudentOntap(context, index) async {
    final studentEdit = StudentModel(
      fName: editFirstNameController.text,
      lName: editLastNameController.text,
      regNum: editRegNoController.text,
      admNum: editAdmNoController.text,
      dOBirth: editDOBirthController.text,
      dept: editDeptController.text,
      eMail: editEMailController.text,
      guardianName: editParentNameController.text,
      mobNum: editMobileNumController.text,
      password: editPasswordController.text,
      gender: editGenderController.text,
      houseName: editHouseNameController.text,
      nationality: editNationalityController.text,
      place: editPlaceController.text,
      postOffice: editPostOfficeController.text,
    );
    // --------------------------------------
    Provider.of<StudentDBProvider>(context, listen: false)
        .editStudent(index, studentEdit);
    // --------------------------------------

    if (editFirstNameController.text.isEmpty ||
        editLastNameController.text.isEmpty ||
        editRegNoController.text.isEmpty ||
        editAdmNoController.text.isEmpty ||
        editDOBirthController.text.isEmpty ||
        editDeptController.text.isEmpty ||
        editEMailController.text.isEmpty ||
        editParentNameController.text.isEmpty ||
        editMobileNumController.text.isEmpty ||
        editGenderController.text.isEmpty ||
        editHouseNameController.text.isEmpty ||
        editNationalityController.text.isEmpty ||
        editPostOfficeController.text.isEmpty ||
        editPlaceController.text.isEmpty ||
        editPasswordController.text.isEmpty) {
      return;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: jSecondaryColor,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(jDefaultPadding),
          content: Text("Updated Student Successfully"),
        ),
      );
    }
  }
}
