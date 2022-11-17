import 'package:edubrain/constants/constant.dart';
import 'package:flutter/material.dart';

class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({super.key});

  static String routeName = 'AdminLoginScreen';

  @override
  State<AdminLoginScreen> createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  final TextEditingController _loginDataController = TextEditingController();

  final TextEditingController _loginPassController = TextEditingController();

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
                    "assets/images/admin.png",
                    height: 150,
                    width: 150,
                  ),
                  jHalfHeightBox,
                  const Text(
                    "Hi Admin",
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Forgot Password ?',
                                  style: TextStyle(
                                    color: jPrimaryColor,
                                  ),
                                ),
                              ),
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
                                      // Navigator.pushReplacementNamed(
                                      //     context, HomeScreen.routeName);
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
      controller: _loginDataController,
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
        RegExp regExp = RegExp(emailPattern);
        if (value == null || value.isEmpty) {
          return "Please Enter Your Number/E-mail";
        } else if (!regExp.hasMatch(value)) {
          return "Please enter valid details";
        }
        return null;
      },
    );
  }

  TextFormField buildPasswordField() {
    return TextFormField(
      controller: _loginPassController,
      maxLength: 8,
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
        if (value!.length < 8) {
          return 'Password must be atleast 8 characters.';
        } else {}
        return null;
      },
    );
  }
}
