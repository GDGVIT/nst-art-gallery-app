import 'package:flutter/material.dart';
import 'package:gdsc_artwork/Auth/AuthUICompnents/AuthBtn.dart';
import 'package:gdsc_artwork/Auth/AuthUICompnents/AuthGoogle.dart';
import 'package:gdsc_artwork/Auth/AuthUICompnents/LoginSingupToogle.dart';
import 'package:gdsc_artwork/Auth/AuthUICompnents/Ordivider.dart';
import 'package:gdsc_artwork/Auth/AuthUICompnents/TextFeildComponent.dart';

import 'package:gdsc_artwork/ViewModel/login_and_signup_provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  final VoidCallback toggleView;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({required this.toggleView});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginAndSignupProvider>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Please login or signup to publish your art in your name!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontFamily: "OutfitRegular",
                fontSize: 20,
              ),
            ),
            SizedBox(height: 35.0),
            ToggleSection(isLogin: true, toggleView: toggleView),
            SizedBox(height: 40.0),
            TextFieldComponent(
              labelText: 'Email',
              controller: emailController,
            ),
            SizedBox(height: 20.0),
            TextFieldComponent(
              labelText: 'Password',
              controller: passwordController,
            ),
            SizedBox(height: 20.0),
            provider.isLoading
                ? CircularProgressIndicator()
                : AuthButton(
                    buttonText: 'Login',
                    onPressed: () {
                      final loginData = {
                        'email': emailController.text,
                        'password': passwordController.text,
                      };
                      provider.userLog(loginData, context);
                    },
                  ),
            SizedBox(height: 20.0),
            OrDivider(),
            SizedBox(height: 15.0),
            GoogleSignInButton(onPressed: () {}, isLogin: true),
          ],
        ),
      ),
    );
  }
}
