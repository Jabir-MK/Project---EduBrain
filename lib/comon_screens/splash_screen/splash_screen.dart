// ignore_for_file: use_build_context_synchronously

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:edubrain/constants/constant.dart';
import 'package:edubrain/comon_screens/login_direct/direct_login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static String routeName = 'SplashScreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // @override
  // void initState() {
  //   checkLogin();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushNamedAndRemoveUntil(
            context, LoginDirect.routeName, (route) => false);
      },
    );

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/app-logo.png",
                height: 450,
              ),
              TextLiquidFill(
                text: "EduBrain",
                waveColor: jWhiteTextColor,
                waveDuration: const Duration(seconds: 3),
                loadDuration: const Duration(seconds: 2),
                boxBackgroundColor: jPrimaryColor,
                textStyle: GoogleFonts.akayaTelivigala(
                  color: jPrimaryColor,
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Future<void> goToLoginPage() async {
  //   await Future.delayed(const Duration(seconds: 2));
  //   Navigator.of(context).pushReplacementNamed(StudentLoginScreen.routeName);

  // }

  // Future<void> checkLogin() async {
  //   final sharedPrefence = await SharedPreferences.getInstance();
  //   final userLogin = sharedPrefence.getBool(saveKeyName);
  //   if (userLogin == null || userLogin == false) {
  //     goToLoginPage();
  //   } else {
  //     Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
  //   }
  // }
}
