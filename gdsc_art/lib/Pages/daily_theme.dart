import 'package:flutter/material.dart';

import '../Constants/Colors.dart';

class DailyTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: CustomColors.primaryBlack,
        child: Center(
          child: Text(
            'Theme of the Day Page',
            style: TextStyle(color: CustomColors.primaryWhite, fontSize: 24),
          ),
        ),
      ),
    );
  }
}
