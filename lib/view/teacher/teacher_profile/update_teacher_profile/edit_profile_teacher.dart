import 'package:edubrain/core/constants/constant.dart';
import 'package:edubrain/core/constants/fontstyle_constants.dart';
import 'package:edubrain/view/teacher/login_screen/login_teacher/teacher_login_screen.dart';
import 'package:edubrain/view/teacher/teacher_profile/controller/teacher_profile_controller.dart';
import 'package:edubrain/view/teacher/teacher_profile/update_teacher_profile/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditTeacherProfileScreen extends StatelessWidget {
  const EditTeacherProfileScreen({
    super.key,
    required this.teacherName,
    required this.teacherGender,
    required this.teacherRegID,
    required this.teacherSubject,
    required this.teacherQualification,
    required this.teacherEMail,
    required this.teacherMobileNum,
    required this.teacherPassword,
    required this.index,
  });
  static String routeName = 'EditTeacherProfileScreen';

  final String teacherGender;
  final String teacherRegID;
  final String teacherName;
  final String teacherSubject;
  final String teacherQualification;
  final String teacherEMail;
  final String teacherMobileNum;
  final String teacherPassword;

  final int index;

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<TeacherProfileController>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      provider.teacherEmailEditController.text = teacherEMail;
      provider.teacherGenderEditController.text = teacherGender;
      provider.teacherMobileEditController.text = teacherMobileNum;
      provider.teacherNameEditController.text = teacherName;
      provider.teacherPasswordEditController.text = teacherPassword;
      provider.teacherQaulEditController.text = teacherQualification;
      provider.teacherRegIDEditController.text = teacherRegID;
      provider.teacherSubjectEditController.text = teacherSubject;
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Profile',
          style: jAkayaTelivigalaAppDefaultStyle,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Container(
            color: jOtherColor,
            child: Form(
              key: provider.formKey,
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
                                  teacherName,
                                  style: jKalamLargeStyle,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  teacherRegID,
                                  style: jAcmeMediumStyle,
                                ),
                                Text(
                                  teacherSubject,
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
                              'Full Name',
                              style: jAlegrayaSansSubTextStyle,
                            ),
                            EditTextField(
                              obscure: false,
                              width: 200,
                              controller: provider.teacherNameEditController,
                              textInputType: TextInputType.name,
                              label: 'Enter Full Name',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Full Name not filled';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Register ID',
                              style: jAlegrayaSansSubTextStyle,
                            ),
                            EditTextField(
                              obscure: false,
                              width: 200,
                              controller: provider.teacherRegIDEditController,
                              textInputType: TextInputType.name,
                              label: 'Enter Register ID',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Register ID not filled';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ],
                        ),
                        jHalfHeightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Gender',
                              style: jAlegrayaSansSubTextStyle,
                            ),
                            EditTextField(
                              obscure: false,
                              width: 200,
                              controller: provider.teacherGenderEditController,
                              textInputType: TextInputType.name,
                              label: 'Enter Your Gender',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Gender not specified';
                                } else {
                                  return null;
                                }
                              },
                            )
                          ],
                        ),
                        jHalfHeightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Qaulification',
                              style: jAlegrayaSansSubTextStyle,
                            ),
                            EditTextField(
                              obscure: false,
                              width: 200,
                              controller: provider.teacherQaulEditController,
                              textInputType: TextInputType.name,
                              label: 'Enter your qaulification',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Qaulification has not filled';
                                } else {
                                  return null;
                                }
                              },
                            )
                          ],
                        ),
                        jHalfHeightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Subject',
                              style: jAlegrayaSansSubTextStyle,
                            ),
                            EditTextField(
                              obscure: false,
                              width: 200,
                              controller: provider.teacherSubjectEditController,
                              textInputType: TextInputType.name,
                              label: 'Enter your subject',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Subject not filled';
                                } else {
                                  return null;
                                }
                              },
                            )
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
                            EditTextField(
                              obscure: false,
                              width: double.infinity,
                              controller: provider.teacherEmailEditController,
                              textInputType: TextInputType.emailAddress,
                              label: 'Enter your E-Mail',
                              validator: (value) {
                                RegExp regExp = RegExp(emailPattern);
                                if (value == null || value.isEmpty) {
                                  return "Please Enter Your E-mail";
                                } else if (!regExp.hasMatch(value)) {
                                  return "Please enter valid details";
                                }
                                return null;
                              },
                            )
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
                            EditTextField(
                              obscure: false,
                              controller: provider.teacherMobileEditController,
                              textInputType: TextInputType.phone,
                              label: 'Enter your number',
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.length != 10) {
                                  return 'Mobile Number not filled';
                                } else {
                                  return null;
                                }
                              },
                              width: double.infinity,
                            )
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
                            EditTextField(
                              obscure: true,
                              controller:
                                  provider.teacherPasswordEditController,
                              textInputType: TextInputType.name,
                              label: 'Enter Password',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password not filled';
                                } else if (value.length < 8) {
                                  return 'Password Must be atleast 8 characters';
                                } else {
                                  return null;
                                }
                              },
                              width: double.infinity,
                            )
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
          if (provider.formKey.currentState!.validate()) {
            provider.editTeacherProfileOnTap(context, index);
            Navigator.of(context).pop(userTeacher);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: jSecondaryColor,
                behavior: SnackBarBehavior.floating,
                margin: EdgeInsets.all(jDefaultPadding),
                content: Text("Field is empty"),
              ),
            );
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
}
