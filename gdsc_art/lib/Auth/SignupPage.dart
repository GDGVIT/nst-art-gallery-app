import 'package:flutter/material.dart';
import 'package:gdsc_artwork/Auth/AuthUICompnents/AuthBtn.dart';
import 'package:gdsc_artwork/Auth/AuthUICompnents/AuthGoogle.dart';
import 'package:gdsc_artwork/Auth/AuthUICompnents/LoginSingupToogle.dart';
import 'package:gdsc_artwork/Auth/AuthUICompnents/Ordivider.dart';
import 'package:gdsc_artwork/Auth/AuthUICompnents/TextFeildComponent.dart';

import 'package:gdsc_artwork/Constants/Colors.dart';
import 'package:gdsc_artwork/Constants/commonToast.dart';
import 'package:gdsc_artwork/ViewModel/login_and_signup_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  final VoidCallback toggleView;

  SignupPage({required this.toggleView});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool showEmailPasswordSection = false;
  File? _profileImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  void _signUp(BuildContext context) {
    final username = usernameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (username.isEmpty || email.isEmpty || password.isEmpty) {
      commonToast('Please fill in all required fields');
      return;
    }

    final data = {
      'name': username,
      'email': email,
      'password': password,
      'image': _profileImage?.path
    };

    context.read<LoginAndSignupProvider>().userSignUp(data, context);
  }

  @override
  Widget build(BuildContext context) {
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
            const SizedBox(height: 35.0),
            ToggleSection(isLogin: false, toggleView: widget.toggleView),
            showEmailPasswordSection
                ? _buildEmailPasswordSection(context)
                : _buildProfileSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Column(
      children: [
        const SizedBox(height: 15.0),
        _profileImage == null
            ? GestureDetector(
                onTap: _pickImage,
                child: Container(
                  width: 80,
                  height: 80,
                  child: _profileImage != null
                      ? Image.file(
                          _profileImage!,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          'images/profilepc.png',
                          fit: BoxFit.contain,
                        ),
                ),
              )
            : ClipOval(
                child: Container(
                  width: 80,
                  height: 80,
                  child: _profileImage != null
                      ? Image.file(
                          _profileImage!,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          'images/profilepc.png',
                          fit: BoxFit.contain,
                        ),
                ),
              ),
        const SizedBox(height: 15.0),
        const Text(
          'Create your profile',
          style: TextStyle(
            color: CustomColors.secondaryBrown,
            fontFamily: "OutfiMedium",
            fontSize: 25,
          ),
        ),
        const SizedBox(height: 23.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'What is your username?',
              style: TextStyle(
                color: Colors.white,
                fontFamily: "OutfitRegular",
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8.0),
            TextFieldComponent(
              labelText: 'Username',
              controller: usernameController,
            ),
          ],
        ),
        const SizedBox(height: 25.0),
        AuthButton(
          buttonText: 'Confirm',
          onPressed: () {
            if (usernameController.text.trim().isEmpty) {
              commonToast('Username cannot be empty');
            } else {
              setState(() {
                showEmailPasswordSection = true;
              });
            }
          },
        ),
      ],
    );
  }

  Widget _buildEmailPasswordSection(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              setState(() {
                showEmailPasswordSection = false;
              });
            },
          ),
        ),
        TextFieldComponent(
          labelText: 'Email',
          controller: emailController,
        ),
        const SizedBox(height: 15.0),
        TextFieldComponent(
          labelText: 'Password',
          controller: passwordController,
          obscureText: true,
        ),
        const SizedBox(height: 20.0),
        Consumer<LoginAndSignupProvider>(
          builder: (context, provider, child) {
            return provider.isLoading
                ? CircularProgressIndicator()
                : AuthButton(
                    buttonText: 'Signup',
                    onPressed: () => _signUp(context),
                  );
          },
        ),
        const SizedBox(height: 15.0),
        OrDivider(),
        const SizedBox(height: 15.0),
        GoogleSignInButton(onPressed: () {}, isLogin: false),
      ],
    );
  }
}
