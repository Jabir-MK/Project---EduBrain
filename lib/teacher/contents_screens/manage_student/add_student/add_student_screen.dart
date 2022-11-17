import 'package:edubrain/constants/constant.dart';
import 'package:edubrain/constants/fontstyle_constants.dart';
import 'package:flutter/material.dart';

class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({super.key});

  static String routeName = 'AddStudentScreen';

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  bool imageAlert = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Student'),
      ),
      body: ListView(
        children: [
          Container(
            color: jOtherColor,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 180,
                  decoration: const BoxDecoration(
                    color: jPrimaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(jDefaultPadding * 3.5),
                      bottomRight: Radius.circular(jDefaultPadding * 3.5),
                    ),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          minRadius: 50,
                          maxRadius: 50,
                          backgroundColor: jSecondaryColor,
                          backgroundImage:
                              AssetImage('assets/images/student.png'),
                        ),
                        jWidthBox,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(children: const [
                              Text(
                                "Jabir MK",
                                style: jKalamLargeStyle,
                              ),
                            ]),
                            const Text(
                              "Class XII CS | Roll No. 24",
                              style: jAcmeMediumStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
