import 'package:flutter/material.dart';
import '../Constants/Colors.dart';

class Sidebar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  Sidebar({required this.selectedIndex, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: CustomColors.primaryBlack,
        child: ListView(
          children: [
            _createDrawerItem(
                context, 0, 'Home', selectedIndex, onItemSelected),
            _createDrawerItem(
                context, 1, 'Theme of the Day', selectedIndex, onItemSelected),
            _createDrawerItem(
                context, 2, 'About', selectedIndex, onItemSelected),
            _createDrawerItem(
                context, 3, 'About GDSC', selectedIndex, onItemSelected),
            _createDrawerItem(
                context, 4, 'View Gallery', selectedIndex, onItemSelected),
          ],
        ),
      ),
    );
  }

  Widget _createDrawerItem(BuildContext context, int index, String title,
      int selectedIndex, Function(int) onItemSelected) {
    return Column(
      children: [
        ListTile(
          title: Text(
            title,
            style: TextStyle(
              color: CustomColors.primaryWhite,
              decoration: index == selectedIndex
                  ? TextDecoration.underline
                  : TextDecoration.none,
            ),
          ),
          onTap: () {
            Navigator.of(context).pop(); // Close the drawer
            onItemSelected(index);
          },
        ),
        Container(
          height: 2,
          color: CustomColors.primaryBrown,
        ),
      ],
    );
  }
}
