import 'package:edubrain/constants/constant.dart';
import 'package:edubrain/constants/fontstyle_constants.dart';
import 'package:edubrain/database/functions/student_section.dart';
import 'package:edubrain/database/model/student/student_data_model.dart';
import 'package:flutter/material.dart';

class EditStudentScreen extends StatefulWidget {
  const EditStudentScreen({
    super.key,
    required this.editFName,
    required this.editLName,
    required this.editRegNo,
    required this.editAdmNo,
    required this.editDOBirth,
    required this.editDept,
    required this.editEMail,
    required this.editParentName,
    required this.editMobileNum,
    required this.index,
    required this.editPassword,
    required this.editNationality,
    required this.editGender,
    required this.editHouseName,
    required this.editPost,
    required this.editPlace,
  });

  final String editFName;
  final String editLName;
  final String editRegNo;
  final String editAdmNo;
  final String editDOBirth;
  final String editDept;
  final String editNationality;
  final String editGender;
  final String editHouseName;
  final String editPost;
  final String editPlace;
  final String editEMail;
  final String editParentName;
  final String editMobileNum;
  final String editPassword;

  final int index;

  static String routeName = 'EditStudentScreen';

  @override
  State<EditStudentScreen> createState() => _EditStudentScreenState();
}

class _EditStudentScreenState extends State<EditStudentScreen> {
  TextEditingController _firstNameEditController = TextEditingController();
  TextEditingController _lastNameEditController = TextEditingController();
  TextEditingController _regNoEditController = TextEditingController();
  TextEditingController _admNoEditController = TextEditingController();
  TextEditingController _dOBirthEditController = TextEditingController();
  TextEditingController _deptEditController = TextEditingController();
  TextEditingController _nationalityEditController = TextEditingController();
  TextEditingController _postOfficeEditController = TextEditingController();
  TextEditingController _placeEditController = TextEditingController();
  TextEditingController _houseNameEditController = TextEditingController();
  TextEditingController _genderEditController = TextEditingController();

  TextEditingController _eMailEditController = TextEditingController();
  TextEditingController _parentNameEditController = TextEditingController();
  TextEditingController _mobileNumEditController = TextEditingController();
  TextEditingController _passwordEditController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _firstNameEditController = TextEditingController(text: widget.editFName);
    _lastNameEditController = TextEditingController(text: widget.editLName);
    _regNoEditController = TextEditingController(text: widget.editRegNo);
    _admNoEditController = TextEditingController(text: widget.editAdmNo);
    _dOBirthEditController = TextEditingController(text: widget.editDOBirth);
    _deptEditController = TextEditingController(text: widget.editDept);
    _eMailEditController = TextEditingController(text: widget.editEMail);
    _parentNameEditController =
        TextEditingController(text: widget.editParentName);
    _mobileNumEditController =
        TextEditingController(text: widget.editMobileNum);
    _passwordEditController = TextEditingController(text: widget.editPassword);
    _nationalityEditController = TextEditingController(
      text: widget.editNationality,
    );
    _genderEditController = TextEditingController(text: widget.editGender);
    _houseNameEditController =
        TextEditingController(text: widget.editHouseName);
    _postOfficeEditController = TextEditingController(text: widget.editPost);
    _placeEditController = TextEditingController(text: widget.editPlace);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: jOtherColor,
      appBar: AppBar(
        title: const Text('Edit Student'),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Container(
            color: jOtherColor,
            child: Form(
              key: _formKey,
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          minRadius: 50,
                          maxRadius: 50,
                          backgroundColor: jSecondaryColor,
                          backgroundImage:
                              AssetImage('assets/images/student.png'),
                        ),
                        jWidthBox,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '${_firstNameEditController.text.toUpperCase()} '
                                  '${_lastNameEditController.text.toUpperCase()}',
                                  style: jKalamLargeStyle,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _regNoEditController.text.toUpperCase(),
                                  style: jAcmeMediumStyle,
                                ),
                                Text(
                                  _deptEditController.text.toUpperCase(),
                                  style: jAcmeMediumStyle,
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'First Name',
                              style: jAlegrayaSansSubTextStyle,
                            ),
                            SizedBox(
                              width: 200,
                              child: TextFormField(
                                controller: _firstNameEditController,
                                keyboardType: TextInputType.name,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text(
                                      'Enter First Name',
                                      style: jAlegrayaSansHeadTextStyle,
                                    )),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'First Name not filled';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        jHalfHeightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Last Name',
                              style: jAlegrayaSansSubTextStyle,
                            ),
                            SizedBox(
                              width: 200,
                              child: TextFormField(
                                controller: _lastNameEditController,
                                keyboardType: TextInputType.name,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text(
                                      'Enter Last Name',
                                      style: jAlegrayaSansHeadTextStyle,
                                    )),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Last Name not filled';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        jHalfHeightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Register No.',
                              style: jAlegrayaSansSubTextStyle,
                            ),
                            SizedBox(
                              width: 200,
                              child: TextFormField(
                                controller: _regNoEditController,
                                keyboardType: TextInputType.name,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text(
                                      'Enter Register No.',
                                      style: jAlegrayaSansHeadTextStyle,
                                    )),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Register No. not filled';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        jHalfHeightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Admission No.',
                              style: jAlegrayaSansSubTextStyle,
                            ),
                            SizedBox(
                              width: 200,
                              child: TextFormField(
                                controller: _admNoEditController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text(
                                      'Enter Admission No.',
                                      style: jAlegrayaSansHeadTextStyle,
                                    )),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Admission No. not filled';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        jHalfHeightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Date of Birth',
                              style: jAlegrayaSansSubTextStyle,
                            ),
                            SizedBox(
                              width: 200,
                              child: TextFormField(
                                controller: _dOBirthEditController,
                                keyboardType: TextInputType.datetime,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text(
                                      'DD / MM / YYYY',
                                      style: jAlegrayaSansHeadTextStyle,
                                    )),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Date of Birth not filled';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        jHalfHeightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Department',
                              style: jAlegrayaSansSubTextStyle,
                            ),
                            SizedBox(
                              width: 200,
                              child: TextFormField(
                                controller: _deptEditController,
                                keyboardType: TextInputType.name,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text(
                                      'Enter Department',
                                      style: jAlegrayaSansHeadTextStyle,
                                    )),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Department not filled';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        jheightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Nationality',
                              style: jAlegrayaSansSubTextStyle,
                            ),
                            SizedBox(
                              width: 200,
                              child: TextFormField(
                                controller: _nationalityEditController,
                                keyboardType: TextInputType.name,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text(
                                      'Enter Nationality',
                                      style: jAlegrayaSansHeadTextStyle,
                                    )),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Department not filled';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        jheightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Gender',
                              style: jAlegrayaSansSubTextStyle,
                            ),
                            SizedBox(
                              width: 200,
                              child: TextFormField(
                                controller: _genderEditController,
                                keyboardType: TextInputType.name,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text(
                                      'Enter Gender',
                                      style: jAlegrayaSansHeadTextStyle,
                                    )),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Department not filled';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        jheightBox,
                        jTwiceThickDivider,
                        const Text(
                          'Address Details',
                          style: jAlegrayaSansSubTextStyle,
                        ),
                        jTwiceThickDivider,
                        jheightBox,
                        //
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'House Name',
                              style: jAlegrayaSansSubTextStyle,
                            ),
                            SizedBox(
                              child: TextFormField(
                                controller: _houseNameEditController,
                                keyboardType: TextInputType.name,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text(
                                      'Enter House Name',
                                      style: jAlegrayaSansHeadTextStyle,
                                    )),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'E-Mail not filled';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        jheightBox,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Post Office',
                              style: jAlegrayaSansSubTextStyle,
                            ),
                            SizedBox(
                              child: TextFormField(
                                controller: _postOfficeEditController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text(
                                      'Enter Post Office',
                                      style: jAlegrayaSansHeadTextStyle,
                                    )),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'E-Mail not filled';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        jheightBox,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Place',
                              style: jAlegrayaSansSubTextStyle,
                            ),
                            SizedBox(
                              child: TextFormField(
                                controller: _placeEditController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text(
                                      'Enter Place',
                                      style: jAlegrayaSansHeadTextStyle,
                                    )),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'E-Mail not filled';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ],
                        ),

                        jheightBox,
                        jTwiceThickDivider,
                        const Text(
                          'Contact Details',
                          style: jAlegrayaSansSubTextStyle,
                        ),
                        jTwiceThickDivider,
                        jheightBox,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'E-Mail',
                              style: jAlegrayaSansSubTextStyle,
                            ),
                            SizedBox(
                              child: TextFormField(
                                controller: _eMailEditController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text(
                                      'Enter E-Mail',
                                      style: jAlegrayaSansHeadTextStyle,
                                    )),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'E-Mail not filled';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        jheightBox,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Name of Parent/Guardian',
                              style: jAlegrayaSansSubTextStyle,
                            ),
                            SizedBox(
                              child: TextFormField(
                                controller: _parentNameEditController,
                                keyboardType: TextInputType.name,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text(
                                      "Enter Parent's / Guardian's Name",
                                      style: jAlegrayaSansHeadTextStyle,
                                    )),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Parent/Guardian Name not filled';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        jheightBox,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Mobile Number',
                              style: jAlegrayaSansSubTextStyle,
                            ),
                            SizedBox(
                              child: TextFormField(
                                controller: _mobileNumEditController,
                                keyboardType: TextInputType.phone,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text(
                                      'Enter Mobile Number',
                                      style: jAlegrayaSansHeadTextStyle,
                                    )),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Last Name not filled';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        jheightBox,
                        jTwiceThickDivider,
                        const Text(
                          'Login Details',
                          style: jAlegrayaSansSubTextStyle,
                        ),
                        jTwiceThickDivider,
                        jheightBox,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Password',
                              style: jAlegrayaSansSubTextStyle,
                            ),
                            SizedBox(
                              child: TextFormField(
                                controller: _passwordEditController,
                                keyboardType: TextInputType.phone,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text(
                                      'Edit Password',
                                      style: jAlegrayaSansHeadTextStyle,
                                    )),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Password not filled';
                                  } else if (value.length < 8) {
                                    return 'Password Must be atleast 8 characters';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            editStudentOntap(context);
            Navigator.of(context).pop();
          } else {}
        },
        backgroundColor: jPrimaryColor,
        child: const Icon(
          Icons.check,
          size: 35,
        ),
      ),
    );
  }

  Future<void> editStudentOntap(context) async {
    final studentEdit = StudentModel(
      fName: _firstNameEditController.text,
      lName: _lastNameEditController.text,
      regNum: _regNoEditController.text,
      admNum: _admNoEditController.text,
      dOBirth: _dOBirthEditController.text,
      dept: _deptEditController.text,
      eMail: _eMailEditController.text,
      guardianName: _parentNameEditController.text,
      mobNum: _mobileNumEditController.text,
      password: _passwordEditController.text,
      gender: _genderEditController.text,
      houseName: _houseNameEditController.text,
      nationality: _nationalityEditController.text,
      place: _placeEditController.text,
      postOffice: _postOfficeEditController.text,
    );
    // --------------------------------------
    editStudent(widget.index, studentEdit);
    // --------------------------------------

    if (_firstNameEditController.text.isEmpty ||
        _lastNameEditController.text.isEmpty ||
        _regNoEditController.text.isEmpty ||
        _admNoEditController.text.isEmpty ||
        _dOBirthEditController.text.isEmpty ||
        _deptEditController.text.isEmpty ||
        _eMailEditController.text.isEmpty ||
        _parentNameEditController.text.isEmpty ||
        _mobileNumEditController.text.isEmpty ||
        _genderEditController.text.isEmpty ||
        _houseNameEditController.text.isEmpty ||
        _nationalityEditController.text.isEmpty ||
        _postOfficeEditController.text.isEmpty ||
        _placeEditController.text.isEmpty ||
        _passwordEditController.text.isEmpty) {
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
