import 'package:flutter/material.dart';
import 'package:gdsc_artwork/Constants/Colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: CustomColors.primaryBlack,
      elevation: 0,
      leadingWidth: 250,
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
          SizedBox(width: 20),
          const Text(
            'ART Gallery',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontFamily: 'OutfitMedium',
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
