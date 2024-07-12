import 'package:flutter/material.dart';
import 'package:gdsc_artwork/Constants/Colors.dart';
import 'package:gdsc_artwork/Pages/select_image_page.dart';
import 'package:gdsc_artwork/UIComponents/imageCrosel.dart';
import 'package:gdsc_artwork/UIComponents/sidebar.dart';

class HomeContent extends StatelessWidget {
  final images = [
    'images/sampleImage1.png',
    'images/sampleImage2.png',
    'images/sampleImage3.png',
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageWidgets = images.map((imagePath) {
      return ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      );
    }).toList();

    return Scaffold(
      backgroundColor: Colors.black,
      drawer: Sidebar(
        selectedIndex: 0,
        onItemSelected: (index) {},
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 60.0),
            Center(
              child: CustomImageSlider(
                width: 320.0,
                height: 350.0,
                widgets: imageWidgets,
                currentIndex: 1,
                onClicked: (index) {},
              ),
            ),
            const SizedBox(height: 40.0),
            const Text(
              'GSDC ARTWORK',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28.0,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SelectImagePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColors.primaryBrown,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 32.0, vertical: 12.0),
                textStyle: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: const Text('Use this style'),
            ),
          ],
        ),
      ),
    );
  }
}
