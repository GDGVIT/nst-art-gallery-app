import 'package:flutter/material.dart';
import 'package:gdsc_artwork/Constants/Colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: CustomColors.primaryBlack,
      elevation: 0,
      leadingWidth: 100,
      leading: Row(
        children: [
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu, color: CustomColors.primaryWhite),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          Image.asset('images/sampleLogo.png', height: 100, fit: BoxFit.fill),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
