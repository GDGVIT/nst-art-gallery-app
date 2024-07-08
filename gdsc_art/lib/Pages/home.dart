import 'package:flutter/material.dart';
import 'package:gdsc_artwork/UIComponents/app_bar.dart';
import '../UIComponents/sideBar.dart';
import 'daily_theme.dart';
import 'about.dart';
import 'about_gdsc.dart';
import 'gallery.dart';
import '../home_content.dart';

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
    AboutGDSC(),
    Gallery(),
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
