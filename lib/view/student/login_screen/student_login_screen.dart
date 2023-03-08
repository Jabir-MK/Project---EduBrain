// ignore_for_file: use_build_context_synchronously

import 'package:edubrain/core/constants/constant.dart';
import 'package:edubrain/database/model/student/student_data_model.dart';
import 'package:edubrain/view/student/login_screen/controller/login_student_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<StudentModel> studentLoginList = [];

class StudentLoginScreen extends StatelessWidget {
  const StudentLoginScreen({super.key});

  static String routeName = 'StudentLoginScreen';

  @override
  Widget build(BuildContext context) {
    final loginProvider =
        Provider.of<StudentLoginProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      studentLoginList = [];
    });
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: ListView(
          children: [
            Container(
              color: const Color(0xFF345FB4),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/student.png",
                    height: 150,
                    width: 150,
                  ),
                  jHalfHeightBox,
                  const Text(
                    "Hi Student",
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
              height: MediaQuery.of(context).size.height,
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
                  children: [
                    Form(
                      key: loginProvider.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          jheightBox,
                          loginProvider.buildEmailField(),
                          jheightBox,
                          loginProvider.buildPasswordField(),
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
                                  backgroundColor:
                                      MaterialStateProperty.all(jPrimaryColor),
                                ),
                                onPressed: () {
                                  if (loginProvider.formKey.currentState!
                                      .validate()) {
                                    loginProvider.checkLoginStudent(context);
                                  }
                                },
                                icon: const Icon(Icons.check),
                                label: const Text("Login"),
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
      ),
    );
  }
}
