import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:edubrain/core/constants/constant.dart';
import 'package:edubrain/view/comon_screens/splash_screen/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static String routeName = 'SplashScreen';

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<SplashProvider>(context, listen: false).checkLogin(context);
    });
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
