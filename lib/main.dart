import 'package:edubrain/core/constants/constant.dart';
import 'package:edubrain/core/constants/fontstyle_constants.dart';
import 'package:edubrain/core/routes/routes.dart';
import 'package:edubrain/database/functions/assignment_section.dart';
import 'package:edubrain/database/functions/student_section.dart';
import 'package:edubrain/database/functions/teacher_section.dart';
import 'package:edubrain/view/comon_screens/splash_screen/controller/splash_controller.dart';
import 'package:edubrain/view/comon_screens/splash_screen/splash_screen.dart';
import 'package:edubrain/view/student/contents_screens/fee_payments/controller/controller.dart';
import 'package:edubrain/view/student/login_screen/controller/login_student_controller.dart';
import 'package:edubrain/view/student/student_profile/controller/student_profile_controller.dart';
import 'package:edubrain/view/teacher/contents_screens/assignments/controller/assignment_controller.dart';
import 'package:edubrain/view/teacher/contents_screens/grades/controller/grades_controller.dart';
import 'package:edubrain/view/teacher/contents_screens/manage_student/controller/manage_student_controller.dart';
import 'package:edubrain/view/teacher/login_screen/login_teacher/controller/teacher_login_controller.dart';
import 'package:edubrain/view/teacher/login_screen/signup/controller/teacher_signup_controller.dart';
import 'package:edubrain/database/model/assignment/assignment_data_model.dart';
import 'package:edubrain/database/model/grades/grades_model.dart';
import 'package:edubrain/database/model/student/student_data_model.dart';
import 'package:edubrain/database/model/teacher_model/teacher_data_model.dart';
import 'package:edubrain/view/teacher/teacher_profile/controller/teacher_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

bool userTeacherLoginKey = false;
bool userStudentLoginKey = false;

const teacherSaveKey = 'TEACHER_LOGIN';
const studentSaveKey = 'STUDENT_LOGIN';

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
  if (!Hive.isAdapterRegistered(GradesModelAdapter().typeId)) {
    Hive.registerAdapter(GradesModelAdapter());
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TeacherLoginProvider()),
        ChangeNotifierProvider(create: (context) => TeacherSignUpProvider()),
        ChangeNotifierProvider(create: (context) => SplashProvider()),
        ChangeNotifierProvider(create: (context) => AssignmentsDBProvider()),
        ChangeNotifierProvider(create: (context) => AssignmentProvider()),
        ChangeNotifierProvider(create: (context) => PaymentsProvider()),
        ChangeNotifierProvider(create: (context) => StudentLoginProvider()),
        ChangeNotifierProvider(create: (context) => StudentProfileController()),
        ChangeNotifierProvider(create: (context) => GradesController()),
        ChangeNotifierProvider(create: (context) => ManageStudentsController()),
        ChangeNotifierProvider(create: (context) => StudentDBProvider()),
        ChangeNotifierProvider(create: (context) => TeacherDBProvider()),
        ChangeNotifierProvider(create: (context) => TeacherProfileController())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "EduBrain",
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: jPrimaryColor,
          primaryColor: jPrimaryColor,
          appBarTheme: const AppBarTheme(
            backgroundColor: jAppBarBackgroundColor,
            titleTextStyle: jAkayaTelivigalaAppDefaultStyle,
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
          ),
        ),
        initialRoute: SplashScreen.routeName,
        routes: routes,
      ),
    );
  }
}
