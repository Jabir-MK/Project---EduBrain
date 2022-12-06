import 'package:edubrain/constants/constant.dart';
import 'package:edubrain/constants/routes.dart';
import 'package:edubrain/comon_screens/splash_screen/splash_screen.dart';
import 'package:edubrain/database/model/assignment/assignment_data_model.dart';
import 'package:edubrain/database/model/student/student_data_model.dart';
import 'package:edubrain/database/model/teacher_model/teacher_data_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(StudentModelAdapter().typeId)) {
    Hive.registerAdapter(StudentModelAdapter());
  }
  if (!Hive.isAdapterRegistered(AssignmentModelAdapter().typeId)) {
    Hive.registerAdapter(AssignmentModelAdapter());
  }
  if (!Hive.isAdapterRegistered(TeacherModelAdapter().typeId)) {
    Hive.registerAdapter(TeacherModelAdapter());
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "EduBrain",
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: jPrimaryColor,
          primaryColor: jPrimaryColor,
          appBarTheme: const AppBarTheme(
            backgroundColor: jAppBarBackgroundColor,
            centerTitle: true,
            elevation: 15,
          ),
          inputDecorationTheme: const InputDecorationTheme(
            labelStyle: TextStyle(
              fontSize: 20,
              color: jPrimaryColor,
              height: 0.5,
            ),

            hintStyle: TextStyle(
              fontSize: 16,
              color: jBlackTextColor,
              height: 0.5,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: jLightTextColor,
                width: 0.7,
              ),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: jLightTextColor,
              ),
            ),
            disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: jLightTextColor,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: jPrimaryColor,
              ),
            ),
            // Use validator for the Process
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: jErrorBorderColor,
                width: 1.2,
              ),
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: jErrorBorderColor,
                width: 1.2,
              ),
            ),
          )),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
