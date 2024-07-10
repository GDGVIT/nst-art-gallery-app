import 'package:flutter/material.dart';
import '../Constants/Colors.dart';

class StylizedImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: CustomColors.primaryBlack,
          padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                        horizontal: 32.0, vertical: 16.0), // Adjust padding
                  ),
                  onPressed: () {
                    // Add your onPressed code here!
                  },
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32.0, vertical: 16.0), // Adjust padding
                    side: const BorderSide(color: CustomColors.primaryBrown),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () {
                    // Add your onPressed code here!
                  },
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
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColors.primaryBlack,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32.0, vertical: 16.0), // Adjust padding
                  ),
                  onPressed: () {
                    // Add your onPressed code here!
                  },
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
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      color: Colors.grey,
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    Container(
                      width: 40,
                      height: 40,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 20.0),
                    Container(
                      width: 40,
                      height: 40,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
