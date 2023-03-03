import 'package:edubrain/core/constants/constant.dart';
import 'package:edubrain/core/constants/fontstyle_constants.dart';
import 'package:edubrain/database/functions/student_section.dart';
import 'package:edubrain/database/model/grades/grades_model.dart';
import 'package:edubrain/database/model/student/student_data_model.dart';
import 'package:edubrain/view/teacher/contents_screens/manage_student/add_student/student_details_formfield/details_formfield.dart';
import 'package:flutter/material.dart';

class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({super.key});

  static String routeName = 'AddStudentScreen';

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _regNoController = TextEditingController();
  final TextEditingController _admNoController = TextEditingController();
  final TextEditingController _dOBirthController = TextEditingController();
  final TextEditingController _deptController = TextEditingController();
  final TextEditingController _nationalityController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _houseNameController = TextEditingController();
  final TextEditingController _postOfficeController = TextEditingController();
  final TextEditingController _placeController = TextEditingController();
  final TextEditingController _eMailController = TextEditingController();
  final TextEditingController _parentNameController = TextEditingController();
  final TextEditingController _mobileNumController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  bool imageAlert = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: jOtherColor,
      appBar: AppBar(
        title: const Text('Add Student'),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Container(
            color: jOtherColor,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 180,
                  decoration: const BoxDecoration(
                    color: jPrimaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(jDefaultPadding * 3.5),
                      bottomRight: Radius.circular(jDefaultPadding * 3.5),
                    ),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircleAvatar(
                          minRadius: 80,
                          maxRadius: 80,
                          backgroundColor: jSecondaryColor,
                          backgroundImage:
                              AssetImage('assets/images/student.png'),
                        ),
                        jWidthBox,
                      ],
                    ),
                  ),
                ),
                jheightBox,
                jTwiceThickDivider,
                const Text(
                  'Basic Details',
                  style: jAlegrayaSansSubTextStyle,
                ),
                jTwiceThickDivider,
                Padding(
                  padding: const EdgeInsets.all(jDefaultPadding),
                  child: Column(
                    children: [
                      AddStudentRowFormField(
                        controller: _firstNameController,
                        detailHead: "First Name",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'First Name not filled';
                          } else {
                            return null;
                          }
                        },
                        labelText: 'Enter First Name',
                        inputType: TextInputType.name,
                      ),
                      jHalfHeightBox,
                      AddStudentRowFormField(
                        controller: _lastNameController,
                        detailHead: 'Last Name',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Last Name not filled';
                          } else {
                            return null;
                          }
                        },
                        labelText: 'Enter Last Name',
                        inputType: TextInputType.name,
                      ),
                      jHalfHeightBox,
                      AddStudentRowFormField(
                        controller: _regNoController,
                        detailHead: 'Register No.',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Register No. not filled';
                          } else {
                            return null;
                          }
                        },
                        labelText: 'Enter Register Number',
                        inputType: TextInputType.name,
                      ),
                      jHalfHeightBox,
                      AddStudentRowFormField(
                        controller: _admNoController,
                        detailHead: 'Admission No.',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Admission No. not filled';
                          } else {
                            return null;
                          }
                        },
                        labelText: 'Enter Admission Number',
                        inputType: TextInputType.number,
                      ),
                      jHalfHeightBox,
                      AddStudentRowFormField(
                        controller: _dOBirthController,
                        detailHead: "Date Of Birth",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Date of Birth not filled';
                          } else {
                            return null;
                          }
                        },
                        labelText: 'Enter Date of Birth',
                        inputType: TextInputType.datetime,
                      ),
                      jheightBox,
                      AddStudentRowFormField(
                        controller: _deptController,
                        detailHead: 'Department',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Department not filled';
                          } else {
                            return null;
                          }
                        },
                        labelText: 'Enter Department Name',
                        inputType: TextInputType.name,
                      ),
                      jheightBox,
                      AddStudentRowFormField(
                        controller: _nationalityController,
                        detailHead: 'Nationality',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Department not filled';
                          } else {
                            return null;
                          }
                        },
                        labelText: 'Enter Nationality',
                        inputType: TextInputType.name,
                      ),
                      jheightBox,
                      AddStudentRowFormField(
                        controller: _genderController,
                        detailHead: "Gender",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Department not filled';
                          } else {
                            return null;
                          }
                        },
                        labelText: "Enter Gender",
                        inputType: TextInputType.name,
                      ),
                      jheightBox,
                      jTwiceThickDivider,
                      const Text(
                        'Address Details',
                        style: jAlegrayaSansSubTextStyle,
                      ),
                      jTwiceThickDivider,
                      jheightBox,
                      AddStudentColumnFormField(
                        visibleText: false,
                        controller: _houseNameController,
                        detailHead: "House Name",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'House Name not filled';
                          } else {
                            return null;
                          }
                        },
                        labelText: 'Enter House Name',
                        inputType: TextInputType.name,
                      ),
                      jheightBox,
                      AddStudentColumnFormField(
                        visibleText: false,
                        controller: _postOfficeController,
                        detailHead: "Post Office",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Post Office not specified';
                          } else {
                            return null;
                          }
                        },
                        labelText: 'Enter Post Office',
                        inputType: TextInputType.name,
                      ),
                      jheightBox,
                      AddStudentColumnFormField(
                        visibleText: false,
                        controller: _placeController,
                        detailHead: "Place",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Place not specified';
                          } else {
                            return null;
                          }
                        },
                        labelText: 'Enter Place',
                        inputType: TextInputType.name,
                      ),
                      jheightBox,
                      jheightBox,
                      jTwiceThickDivider,
                      const Text(
                        'Contact Details',
                        style: jAlegrayaSansSubTextStyle,
                      ),
                      jTwiceThickDivider,
                      jheightBox,
                      AddStudentColumnFormField(
                        visibleText: false,
                        controller: _eMailController,
                        detailHead: 'E-Mail',
                        validator: (value) {
                          RegExp regExp = RegExp(emailPattern);
                          if (value == null || value.isEmpty) {
                            return "Please Enter Your Number/E-mail";
                          } else if (!regExp.hasMatch(value)) {
                            return "Please enter valid details";
                          }
                          return null;
                        },
                        labelText: 'Enter E-Mail',
                        inputType: TextInputType.emailAddress,
                      ),
                      jheightBox,
                      AddStudentColumnFormField(
                        controller: _parentNameController,
                        detailHead: 'Name of Parent/Guardian',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Name not filled';
                          } else {
                            return null;
                          }
                        },
                        labelText: "Enter Parent's / Guardian's Name",
                        inputType: TextInputType.name,
                        visibleText: false,
                      ),
                      jheightBox,
                      AddStudentColumnFormField(
                        controller: _mobileNumController,
                        detailHead: 'Mobile Number',
                        validator: (value) {
                          if (value!.length != 10) {
                            return 'Password must be atleast 8 characters.';
                          } else {
                            return null;
                          }
                        },
                        labelText: 'Enter Mobile Number',
                        inputType: TextInputType.phone,
                        visibleText: false,
                      ),
                      jheightBox,
                      jTwiceThickDivider,
                      const Text(
                        'Login Details',
                        style: jAlegrayaSansSubTextStyle,
                      ),
                      jTwiceThickDivider,
                      jheightBox,
                      AddStudentColumnFormField(
                        controller: _passController,
                        detailHead: "Password",
                        validator: (value) {
                          if (value!.length < 8) {
                            return 'Password must be atleast 8 characters.';
                          } else {
                            return null;
                          }
                        },
                        labelText: "Enter Password",
                        inputType: TextInputType.visiblePassword,
                        visibleText: true,
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            addStudentOnTap();
          } else {
            return;
          }
        },
        backgroundColor: jPrimaryColor,
        child: const Icon(
          Icons.check,
          size: 35,
        ),
      ),
    );
  }

  Future<void> addStudentOnTap() async {
    final firstName = _firstNameController.text.trim();
    final lastName = _lastNameController.text.trim();
    final registerNum = _regNoController.text.trim();
    final admissionNum = _admNoController.text.trim();
    final dateOfBirth = _dOBirthController.text.trim();
    final department = _deptController.text.trim();
    final parentName = _parentNameController.text.trim();
    final mobileNumber = _mobileNumController.text.trim();
    final eMailAddress = _eMailController.text.trim();
    final pword = _passController.text.trim();
    final nationalilty = _nationalityController.text.trim();
    final gender = _genderController.text.trim();
    final houseName = _houseNameController.text.trim();
    final postOffice = _postOfficeController.text.trim();
    final place = _placeController.text.trim();

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
    addStudent(student);
    Navigator.of(context).pop();
  }
}
