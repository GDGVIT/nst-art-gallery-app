import 'package:flutter/material.dart';
import '../Constants/Colors.dart';

class Sidebar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  Sidebar({required this.selectedIndex, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Drawer(
        width: MediaQuery.of(context).size.width * 0.5,
        child: Container(
          color: CustomColors.primaryBlack,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: _createDrawerItem(
                    context, 0, 'HOME', selectedIndex, onItemSelected),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: _createDrawerItem(context, 1, 'THEME OF\n THE DAY',
                    selectedIndex, onItemSelected),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: _createDrawerItem(
                    context, 2, 'ABOUT', selectedIndex, onItemSelected),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: _createDrawerItem(
                    context, 3, 'VIEW GALLERY', selectedIndex, onItemSelected),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createDrawerItem(BuildContext context, int index, String title,
      int selectedIndex, Function(int) onItemSelected) {
    return Column(
      children: [
        ListTile(
          title: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontFamily: "OutfitMedium",
                color: CustomColors.primaryWhite,
                decoration: index == selectedIndex
                    ? TextDecoration.underline
                    : TextDecoration.none,
              ),
            ),
          ),
          onTap: () {
            Navigator.of(context).pop(); // Close the drawer
            onItemSelected(index);
          },
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.3,
          height: 2,
          color: CustomColors.primaryBrown,
        ),
      ],
    );
  }
}
