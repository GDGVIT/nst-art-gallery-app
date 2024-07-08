import 'package:flutter/material.dart';

import '../Constants/Colors.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: CustomColors.primaryBlack,
        child: Center(
          child: Text(
            'About Page',
            style: TextStyle(color: CustomColors.primaryWhite, fontSize: 24),
          ),
        ),
      ),
    );
  }
}
