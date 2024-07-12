import 'package:flutter/material.dart';
import 'package:gdsc_artwork/Pages/about.dart';
import 'package:gdsc_artwork/Pages/account.dart';
import 'package:gdsc_artwork/Pages/daily_theme.dart';
import 'package:gdsc_artwork/Pages/gallery.dart';
import 'package:gdsc_artwork/UIComponents/app_bar.dart';
import 'package:gdsc_artwork/UIComponents/sideBar.dart';
import 'package:gdsc_artwork/Pages/home_content.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeContent(),
    DailyTheme(),
    About(),
    Gallery(),
    Account()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: Sidebar(
        selectedIndex: _selectedIndex,
        onItemSelected: _onItemTapped,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
    );
  }
}
