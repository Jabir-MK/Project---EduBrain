// ignore_for_file: use_build_context_synchronously

import 'package:edubrain/core/constants/constant.dart';
import 'package:edubrain/view/teacher/login_screen/login_teacher/controller/teacher_login_controller.dart';
import 'package:edubrain/database/model/teacher_model/teacher_data_model.dart';
import 'package:edubrain/view/teacher/login_screen/login_teacher/widgets/elevated_button.dart';
import 'package:edubrain/view/teacher/login_screen/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

TeacherModel? userTeacher;

class TeacherLoginScreen extends StatelessWidget {
  const TeacherLoginScreen({super.key});

  static String routeName = 'TeacherLoginScreen';

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TeacherLoginProvider>(context, listen: false);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: ListView(
          children: [
            Container(
              color: jPrimaryColor,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/teacher.png",
                    height: 150,
                    width: 150,
                  ),
                  const Text(
                    "Hi Teacher",
                    style: TextStyle(
                      color: jWhiteTextColor,
                      fontFamily: 'Kalam',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Sign-in to continue.",
                    style: TextStyle(
                      color: jWhiteTextColor,
                      fontFamily: 'AkayaTelivigala',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(jDefaultPadding * 3),
                  topRight: Radius.circular(jDefaultPadding * 3),
                ),
                color: jOtherColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(jDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Form(
                      key: provider.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          provider.buildEmailField(
                              provider.teacherLoginDataController),
                          jheightBox,
                          provider.buildPasswordField(
                              provider.teacherLoginPassController),
                          jheightBox,
                          jheightBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton.icon(
                                  style: ButtonStyle(
                                    elevation: MaterialStateProperty.all(10),
                                    shadowColor: MaterialStateProperty.all(
                                        jSecondaryColor),
                                    backgroundColor: MaterialStateProperty.all(
                                        jPrimaryColor),
                                  ),
                                  onPressed: () async {
                                    if (provider.formKey.currentState!
                                        .validate()) {
                                      provider.checkTeacherLogin(
                                        context,
                                        provider.teacherLoginDataController,
                                        provider.teacherLoginPassController,
                                      );
                                    }
                                  },
                                  icon: const Icon(Icons.check),
                                  label: const Text("Sign-In")),
                            ],
                          ),
                          jheightBox,
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'New here ? Sign-Up to Continue.',
                                style: TextStyle(
                                    color: jPrimaryColor,
                                    fontWeight: FontWeight.w600),
                              ),
                              jHalfHeightBox,
                              CustomButtonWidget(
                                elevation: 10,
                                onPressAction: () =>
                                    Navigator.pushReplacementNamed(
                                        context, TeacherSignUpScreen.routeName),
                                text: 'Create Account',
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
      ),
    );
  }
}
