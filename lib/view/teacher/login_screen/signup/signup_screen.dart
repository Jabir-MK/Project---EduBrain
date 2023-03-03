import 'package:edubrain/constants/constant.dart';
import 'package:edubrain/view/teacher/login_screen/signup/controller/teacher_signup_controller.dart';
import 'package:edubrain/database/functions/teacher_section.dart';
import 'package:edubrain/database/model/teacher_model/teacher_data_model.dart';
import 'package:edubrain/view/teacher/login_screen/login_teacher/teacher_login_screen.dart';
import 'package:edubrain/view/teacher/login_screen/signup/signup_success.dart';
import 'package:edubrain/view/teacher/login_screen/signup/widget/elevated_button.dart';
import 'package:edubrain/view/teacher/login_screen/signup/widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TeacherSignUpScreen extends StatelessWidget {
  const TeacherSignUpScreen({super.key});

  static String routeName = 'TeacherSignUpScreen';

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TeacherSignUpProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              color: jPrimaryColor,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/teacher.png",
                    height: 100,
                    width: 150,
                  ),
                  jHalfHeightBox,
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
                    "Create an Account.",
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
                child: Form(
                  key: provider.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextFieldWidget(
                        controller: provider.signUpUserNameController,
                        label: 'Username',
                        returnValue: 'Please enter your name',
                        obscure: false,
                        textInputType: TextInputType.name,
                      ),
                      jheightBox,
                      TextFieldWidget(
                        textInputType: TextInputType.emailAddress,
                        controller: provider.signUpEmailController,
                        label: 'E-mail',
                        returnValue: 'Please enter your Email',
                        obscure: false,
                      ),
                      jheightBox,
                      TextFieldWidget(
                        controller: provider.signUpPasswordController,
                        label: 'Password',
                        returnValue: 'Please enter your password',
                        obscure: true,
                        textInputType: TextInputType.name,
                      ),
                      jheightBox,
                      ElevatedButtonWidget(
                        text: 'Create Account',
                        onPressAction: () {
                          if (provider.formKey.currentState!.validate()) {
                            provider.signUpTeacherOnTap(context);
                          } else {}
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Already a member ?',
                            style: TextStyle(
                                color: jPrimaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 15),
                          ),
                          ElevatedButtonWidget(
                            text: 'Login',
                            onPressAction: () => Navigator.pushNamed(
                                context, TeacherLoginScreen.routeName),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
