import 'package:flutter/material.dart';
import 'package:gdsc_artwork/Auth/LoginPage.dart';
import 'package:gdsc_artwork/Auth/SignupPage.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLogin = true;

  void toggleView() {
    setState(() {
      showLogin = !showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: showLogin
          ? LoginPage(toggleView: toggleView)
          : SignupPage(toggleView: toggleView),
    );
  }
}
