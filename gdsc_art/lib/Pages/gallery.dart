import 'package:flutter/material.dart';
import '../Constants/Colors.dart';

class Gallery extends StatelessWidget {
  const Gallery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.primaryBlack,
      body: SingleChildScrollView(
        child: Container(
          color: CustomColors.primaryBlack,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'ART GALLERY',
                  style: TextStyle(
                    color: CustomColors.primaryWhite,
                    fontFamily: "OutfitMedium",
                    fontSize: 50,
                    letterSpacing: -5,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15.0,
                  mainAxisSpacing: 15.0,
                ),
                itemCount: 8, // 3 columns with 2 boxes each
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.grey[300], // Light gray color
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
