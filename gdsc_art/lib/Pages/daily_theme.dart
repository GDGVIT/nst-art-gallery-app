import 'package:flutter/material.dart';
import '../Constants/Colors.dart';

class DailyTheme extends StatelessWidget {
  final images = [
    'images/sampleImage4.png',
    'images/sampleImage5.png',
    'images/sampleImage6.png',
    'images/sampleImage7.png',
  ];

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double imageHeight = screenHeight * 0.3;

    return Scaffold(
      body: Container(
        color: CustomColors.primaryBlack,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'THEME OF THE DAY',
                style: TextStyle(
                  color: CustomColors.primaryBrown,
                  fontFamily: "OutfitRegular",
                  fontSize: 24,
                ),
              ),
            ),
            const SizedBox(height: 20.0), // Spacing below the title
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          images[0],
                          height: imageHeight,
                          width: (MediaQuery.of(context).size.width / 2) - 24,
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          images[1],
                          height: imageHeight,
                          width: (MediaQuery.of(context).size.width / 2) - 24,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0), // Spacing below the images
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                        'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                        style: TextStyle(
                            color: CustomColors.primaryWhite,
                            fontSize: 16.0,
                            fontFamily: 'Outfit'),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 20.0), // Spacing below the text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          images[2],
                          height: imageHeight,
                          width: (MediaQuery.of(context).size.width / 2) - 24,
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          images[3],
                          height: imageHeight,
                          width: (MediaQuery.of(context).size.width / 2) - 24,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
