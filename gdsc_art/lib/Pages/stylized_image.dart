import 'package:flutter/material.dart';
import '../Constants/Colors.dart';

class StylizedImagePageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      color: CustomColors.primaryBlack,
      padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'STYLIZED IMAGE',
              style: TextStyle(
                color: CustomColors.primaryBrown,
                fontFamily: "OutfitRegular",
                fontSize: 24,
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          Center(
            child: Container(
              height: screenHeight * 0.3, // 30% of screen height
              width: screenWidth * 0.75, // 75% of screen width
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 20.0),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColors.primaryBrown,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 32.0, vertical: 8.0), // Adjust padding
              ),
              onPressed: () {},
              child: const Text(
                'Download',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          Center(
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: CustomColors.primaryBlack,
                padding:
                    const EdgeInsets.symmetric(horizontal: 44.0, vertical: 6),
                side: const BorderSide(color: CustomColors.primaryBrown),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onPressed: () {},
              child: const Text(
                'Share',
                style: TextStyle(
                  color: CustomColors.primaryBrown,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          Center(
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: CustomColors.primaryBlack,
                padding:
                    const EdgeInsets.symmetric(horizontal: 42.0, vertical: 6.0),
                side: const BorderSide(color: CustomColors.primaryBrown),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onPressed: () {},
              child: const Text(
                'Publish',
                style: TextStyle(
                  color: CustomColors.primaryBrown,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 40.0),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  color: Colors.grey[300],
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 20.0),
                Container(
                  width: 60,
                  height: 60,
                  color: Colors.grey[300],
                ),
                const SizedBox(width: 20.0),
                Container(
                  width: 60,
                  height: 60,
                  color: Colors.grey[300],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
