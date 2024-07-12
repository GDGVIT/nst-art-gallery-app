import 'package:flutter/material.dart';
import 'package:gdsc_artwork/Auth/AuthUICompnents/AuthBtn.dart';
import 'package:gdsc_artwork/Auth/AuthUICompnents/AuthGoogle.dart';
import 'package:gdsc_artwork/Auth/AuthUICompnents/LoginSingupToogle.dart';
import 'package:gdsc_artwork/Auth/AuthUICompnents/Ordivider.dart';
import 'package:gdsc_artwork/Auth/AuthUICompnents/TextFeildComponent.dart';

class LoginPage extends StatelessWidget {
  final VoidCallback toggleView;

  LoginPage({required this.toggleView});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'LOGIN',
            style: TextStyle(
              color: Colors.white,
              fontFamily: "OutfitRegular",
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 15.0),
          ToggleSection(isLogin: true, toggleView: toggleView),
          const SizedBox(height: 15.0),
          TextFieldComponent(labelText: 'Username'),
          const SizedBox(height: 15.0),
          TextFieldComponent(labelText: 'Password'),
          const SizedBox(height: 15.0),
          AuthButton(buttonText: 'Login', onPressed: () {}),
          const SizedBox(height: 15.0),
          OrDivider(),
          const SizedBox(height: 15.0),
          GoogleSignInButton(onPressed: () {}, isLogin: true),
        ],
      ),
    );
  }
}
