import 'package:flutter/material.dart';
import 'package:gdsc_artwork/Auth/LoginPage.dart';
import 'package:gdsc_artwork/Auth/SignupPage.dart';
import '../Constants/Colors.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  void toggleView() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.primaryBlack,
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: isLogin
            ? LoginPage(toggleView: toggleView)
            : SignupPage(toggleView: toggleView),
      ),
    );
  }
}
