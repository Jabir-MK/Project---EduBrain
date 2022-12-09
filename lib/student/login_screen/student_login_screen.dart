import 'dart:developer';

import 'package:edubrain/constants/constant.dart';
import 'package:edubrain/student/home_screen/student_home_screen.dart';
import 'package:flutter/material.dart';

class StudentLoginScreen extends StatefulWidget {
  const StudentLoginScreen({super.key});

  static String routeName = 'StudentLoginScreen';

  @override
  State<StudentLoginScreen> createState() => _StudentLoginScreenState();
}

class _StudentLoginScreenState extends State<StudentLoginScreen> {
  final TextEditingController _studentLoginDataController =
      TextEditingController();

  final TextEditingController _studentLoginPassController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: ListView(
          children: [
            Container(
              color: const Color(0xFF345FB4),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.8,
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
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          jheightBox,
                          buildEmailField(),
                          jheightBox,
                          buildPasswordField(),
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
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      Navigator.pushReplacementNamed(
                                          context, StudentHomeScreen.routeName);
                                    }
                                  },
                                  icon: const Icon(Icons.check),
                                  label: const Text("Login")),
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

  TextFormField buildEmailField() {
    return TextFormField(
      controller: _studentLoginDataController,
      textAlign: TextAlign.start,
      keyboardType: TextInputType.emailAddress,
      style: const TextStyle(
        color: jBlackTextColor,
        fontWeight: FontWeight.w600,
        fontSize: 17,
      ),
      decoration: const InputDecoration(
        labelText: "Mobile Number/E-mail",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        isDense: true,
      ),
      validator: (value) {
        RegExp regExpEmail = RegExp(emailPattern);
        RegExp regExpMobile = RegExp(mobilePattern);
        if (value == null || value.isEmpty) {
          return "Please Enter Your Number/E-mail";
        }
        if (!regExpEmail.hasMatch(value)) {
          return 'Please enter a valid Email';
        } else if (!regExpMobile.hasMatch(value)) {
          return 'Please enter a valid Mobile Number';
        }

        // ignore: dead_code
        if (regExpMobile.hasMatch(value)) {
          if (value.length != 10) {
            return 'Mobile not valid';
          } else {
            log('MOBILE NUMBER');
          }
        }
        return null;
      },
    );
  }

  TextFormField buildPasswordField() {
    return TextFormField(
      controller: _studentLoginPassController,
      textAlign: TextAlign.start,
      obscureText: true,
      keyboardType: TextInputType.name,
      style: const TextStyle(
        color: jBlackTextColor,
        fontWeight: FontWeight.w600,
        fontSize: 17,
      ),
      decoration: const InputDecoration(
        labelText: "Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        isDense: true,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Password not filled";
        } else if (value.length < 8) {
          return 'Password must be atleast 8 characters';
        } else {
          return null;
        }
      },
    );
  }
}
// import 'package:flutter/material.dart';

// class StudentScreen extends StatefulWidget {
//   const StudentScreen({super.key});

//   static String routeName = 'TDRute';

//   @override
//   State<StudentScreen> createState() => _StudentScreenState();
// }

// class _StudentScreenState extends State<StudentScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: SafeArea(child: Text('hellooooo')),
//     );
//   }
// }
