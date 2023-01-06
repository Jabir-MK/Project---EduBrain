import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:edubrain/comon_screens/login_direct/direct_login.dart';
import 'package:edubrain/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static String routeName = 'SplashScreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginDirect(),
          ),
        );
      },
    );

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                "assets/images/app-logo.png",
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
              ),
              TextLiquidFill(
                boxHeight: 150,
                text: "EduBrain",
                waveColor: jWhiteTextColor,
                waveDuration: const Duration(seconds: 3),
                loadDuration: const Duration(seconds: 2),
                boxBackgroundColor: jPrimaryColor,
                textStyle: GoogleFonts.akayaTelivigala(
                  color: jPrimaryColor,
                  fontSize: 75,
                  fontWeight: FontWeight.bold,
                  // letterSpacing: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
// ------------------- MY  STYLE OF CHECKING PREVIOUS LOGIN --------------------

  // Future<void> goToLoginDirectPage() async {
  //   await Future.delayed(const Duration(seconds: 2));
  //   // ignore: use_build_context_synchronously
  //   Navigator.of(context).pushReplacement(
  //     MaterialPageRoute(
  //       builder: (context) => const LoginDirect(),
  //     ),
  //   );
  // }

  // Future<void> checkLogin() async {
  //   final sharedPrefence = await SharedPreferences.getInstance();
  //   final userLogin = sharedPrefence.getBool(saveKeyNameTeacher);
  //   // log(userLogin.toString());
  //   if (userLogin == null || userLogin == false) {
  //     goToLoginDirectPage();
  //   } else {
  //     // Navigate to previous section logged in
  //     // ignore: use_build_context_synchronously
  //     // Navigator.of(context).pushReplacement(MaterialPageRoute(
  //     //   builder: (context) => const TeacherHomeScreen(),
  //     // ));
  //     log('Went to HomeScreen');
  //   }
  // }
}
