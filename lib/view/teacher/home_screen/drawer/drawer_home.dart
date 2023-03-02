import 'package:edubrain/constants/constant.dart';
import 'package:edubrain/view/teacher/contents_screens/assignments/teacher_assignment_screen.dart';
import 'package:edubrain/view/teacher/contents_screens/grades/grades_studentlist_screen.dart';
import 'package:edubrain/view/teacher/contents_screens/manage_student/student_manage.dart';
import 'package:edubrain/view/teacher/contents_screens/time_table/teacher_time_table_screen.dart';
import 'package:edubrain/view/teacher/home_screen/drawer/drawer_contents.dart';
import 'package:edubrain/view/teacher/teacher_profile/teacher_profile_screen.dart';
import 'package:edubrain/view/teacher/teacher_profile/teacher_signout.dart';
import 'package:flutter/material.dart';

class HomeScreenDrawer extends StatelessWidget {
  const HomeScreenDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text(
              '',
              // currentLoggedTeacher[0].teacherName,
              style: TextStyle(
                fontFamily: 'Kalam',
                color: jBlackTextColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            accountEmail: const Text(
              '',
              // currentLoggedTeacher[0].teacherEMail,
              style: TextStyle(
                fontFamily: 'Kalam',
                color: jBlackTextColor,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: jSecondaryColor,
              child: ClipOval(
                child: Image.asset(
                  'assets/images/teacher.png',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: jPrimaryColor,
              image: DecorationImage(
                image: AssetImage('assets/images/drawer.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          DrawerListItems(
            iconColor: jPrimaryColor,
            listTitle: 'Profile',
            listIcon: Icons.person_outline,
            listOnTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const TeacherProfileScreen(
                    teacherFullName: '',
                    // currentLoggedTeacher[0].teacherName,
                    teacherGender: '',
                    //  currentLoggedTeacher[0].teacherGender,
                    teacherRegID: '',
                    //  currentLoggedTeacher[0].teacherRegID,
                    teacherSubject: '',
                    // currentLoggedTeacher[0].teacherSubject,
                    teacherQualification: '',

                    // currentLoggedTeacher[0].teacherQualification,
                    teacherEMail: '',
                    //  currentLoggedTeacher[0].teacherEMail,
                    teacherMobileNum: '',
                    // currentLoggedTeacher[0].teacherMobileNum,
                    teacherPassword: '',
                    //  currentLoggedTeacher[0].teacherPassword,
                  ),
                ),
              );
            },
          ),
          jColoredDivider,
          DrawerListItems(
            iconColor: jPrimaryColor,
            listTitle: 'Manage Students',
            listIcon: Icons.groups_outlined,
            listOnTap: () {
              Navigator.of(context).pushNamed(TeacherStudentManage.routeName);
            },
          ),
          jColoredDivider,
          DrawerListItems(
            iconColor: jPrimaryColor,
            listIcon: Icons.assignment_outlined,
            listOnTap: () {
              Navigator.of(context)
                  .pushNamed(TeacherAssignmentsScreen.routeName);
            },
            listTitle: 'Assignments',
          ),
          DrawerListItems(
            iconColor: jPrimaryColor,
            listTitle: 'Grades',
            listIcon: Icons.text_increase_rounded,
            listOnTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const TeacherGradesScreen(),
                ),
              );
            },
          ),
          DrawerListItems(
            iconColor: jPrimaryColor,
            listTitle: 'Time Table',
            listIcon: Icons.calendar_month_outlined,
            listOnTap: () {
              Navigator.of(context).pushNamed(TeacherTimeTableScreen.routeName);
            },
          ),
          jColoredDivider,
          DrawerListItems(
            iconColor: jLightTextColor,
            listTitle: 'Settings',
            listIcon: Icons.settings_outlined,
            listOnTap: () {},
          ),
          DrawerListItems(
            iconColor: Colors.blue,
            listTitle: 'Share App',
            listIcon: Icons.share_outlined,
            listOnTap: () {},
          ),
          DrawerListItems(
            iconColor: jErrorBorderColor,
            listTitle: 'Log out',
            listIcon: Icons.logout_outlined,
            listOnTap: () {
              confirmSignOutTeacher(context);
            },
          ),
          jColoredDivider,
          DrawerListItems(
            iconColor: jErrorBorderColor,
            listTitle: 'Exit App',
            listIcon: Icons.exit_to_app_outlined,
            listOnTap: () {},
          ),
          jColoredDivider,
        ],
      ),
    );
  }
}
