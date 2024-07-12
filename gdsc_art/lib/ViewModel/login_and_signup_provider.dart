import 'package:flutter/material.dart';
import 'package:gdsc_artwork/Constants/commonToast.dart';
import 'package:gdsc_artwork/model/DataModel/model.dart';
import 'package:gdsc_artwork/model/repo/repo.dart';
import 'package:provider/provider.dart';
import 'user_notifier.dart';
import 'dart:convert';

class LoginAndSignupProvider with ChangeNotifier {
  final appRepo = AppRepo();
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> userLog(dynamic data, BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    try {
      print("Starting login with data: $data");
      var response = await appRepo.userLogin(data);
      print("Response from login: $response");

      if (response['status'] == 'success') {
        _isLoading = false;
        notifyListeners();

        User user = User.fromJson(response['user']);
        print("Parsed user: $user");

        Provider.of<UserNotifier>(context, listen: false).setUser(user);

        Navigator.pushReplacementNamed(context, '/home');
      } else {
        _isLoading = false;
        notifyListeners();
        commonToast(response['message']);
      }
    } catch (error) {
      _isLoading = false;
      notifyListeners();
      print("Error during login: $error");

      String errorMessage = "Something went wrong";
      try {
        var errorResponse = jsonDecode((error as Exception).toString());
        if (errorResponse.containsKey('message')) {
          errorMessage = errorResponse['message'];
        }
      } catch (e) {
        print("Error parsing error response: $e");

        final RegExp regExp = RegExp(r'"message":"([^"]+)"');
        final match = regExp.firstMatch(error.toString());
        if (match != null) {
          errorMessage = match.group(1) ?? errorMessage;
        }
      }
      commonToast(errorMessage);
    }
  }

  Future<void> userSignUp(dynamic data, BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    try {
      print("Starting signup with data: $data");
      var response = await appRepo.userSignup(data);
      print("Response from signup: $response");

      if (response['status'] == 'success') {
        _isLoading = false;
        notifyListeners();

        User user = User.fromJson(response['user']);
        print("Parsed user: $user");

        Provider.of<UserNotifier>(context, listen: false).setUser(user);

        Navigator.pushReplacementNamed(context, '/home');
      } else {
        _isLoading = false;
        notifyListeners();
        commonToast(response['message']);
      }
    } catch (error) {
      _isLoading = false;
      notifyListeners();
      print("Error during signup: $error");

      String errorMessage = "Something went wrong";
      try {
        var errorResponse = jsonDecode((error as Exception).toString());
        if (errorResponse.containsKey('message')) {
          errorMessage = errorResponse['message'];
        }
      } catch (e) {
        print("Error parsing error response: $e");

        final RegExp regExp = RegExp(r'"message":"([^"]+)"');
        final match = regExp.firstMatch(error.toString());
        if (match != null) {
          errorMessage = match.group(1) ?? errorMessage;
        }
      }
      commonToast(errorMessage);
    }
  }
}
