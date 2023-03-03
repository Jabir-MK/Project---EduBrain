import 'package:edubrain/constants/constant.dart';
import 'package:edubrain/view/student/contents_screens/assignments/student_assignment_screen.dart';
import 'package:edubrain/view/student/contents_screens/grades/grades_screen.dart';
import 'package:edubrain/view/student/contents_screens/time_table/student_time_table_screen.dart';
import 'package:edubrain/view/student/home_screen/widgets/drawer_contents.dart';
import 'package:edubrain/view/student/login_screen/student_login_screen.dart';
import 'package:edubrain/view/student/student_profile/student_profile_screen.dart';
import 'package:edubrain/view/student/student_profile/student_signout.dart';
import 'package:flutter/material.dart';

class StudentHomeScreenDrawer extends StatelessWidget {
  const StudentHomeScreenDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              studentLoginList[0].fName,
              style: const TextStyle(
                fontFamily: 'Kalam',
                color: jBlackTextColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            accountEmail: Text(
              studentLoginList[0].eMail,
              style: const TextStyle(
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
          DrawerListItemsStudent(
            iconColor: jPrimaryColor,
            listTitle: 'Profile',
            listIcon: Icons.person_outline,
            listOnTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const StudentProfileScreen(),
                ),
              );
            },
          ),
          jColoredDivider,
          DrawerListItemsStudent(
            iconColor: jPrimaryColor,
            listIcon: Icons.assignment_outlined,
            listOnTap: () {
              Navigator.of(context)
                  .pushNamed(StudentAssignmentsScreen.routeName);
            },
            listTitle: 'Assignments',
          ),
          DrawerListItemsStudent(
            iconColor: jPrimaryColor,
            listTitle: 'Grades',
            listIcon: Icons.text_increase_rounded,
            listOnTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => StudentGradesScreen(
                    studentModel: studentLoginList[0],
                  ),
                ),
              );
            },
          ),
          DrawerListItemsStudent(
            iconColor: jPrimaryColor,
            listTitle: 'Time Table',
            listIcon: Icons.calendar_month_outlined,
            listOnTap: () {
              Navigator.of(context).pushNamed(StudentTimeTableScreen.routeName);
            },
          ),
          jColoredDivider,
          DrawerListItemsStudent(
            iconColor: jLightTextColor,
            listTitle: 'Settings',
            listIcon: Icons.settings_outlined,
            listOnTap: () {},
          ),
          DrawerListItemsStudent(
            iconColor: Colors.blue,
            listTitle: 'Share App',
            listIcon: Icons.share_outlined,
            listOnTap: () {},
          ),
          DrawerListItemsStudent(
            iconColor: jErrorBorderColor,
            listTitle: 'Log out',
            listIcon: Icons.logout_outlined,
            listOnTap: () {
              confirmSignOutStudent(context);
            },
          ),
          jColoredDivider,
          DrawerListItemsStudent(
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
