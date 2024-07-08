import 'package:flutter/material.dart';
import 'package:gdsc_artwork/UIComponents/imageCrosel.dart';

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
      body: Center(
        child: CustomImageSlider(
          width: 250.0,
          height: 300.0,
          widgets: imageWidgets,
          currentIndex: 1,
          onClicked: (index) {
            // No action required on click for now
          },
        ),
      ),
    );
  }
}
