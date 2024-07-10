import 'package:flutter/material.dart';
import 'package:gdsc_artwork/Pages/stylized_image.dart';
import 'package:image_picker/image_picker.dart';
import '../Constants/Colors.dart';
import 'dart:io';

class SelectImagePage extends StatefulWidget {
  @override
  _SelectImagePageState createState() => _SelectImagePageState();
}

class _SelectImagePageState extends State<SelectImagePage> {
  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

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
                  'Primary Image',
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
                  decoration: BoxDecoration(
                    border: Border.all(color: CustomColors.primaryBrown),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: _image == null
                      ? Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: CustomColors.primaryWhite,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            onPressed: _pickImage,
                            child: const Text(
                              'Upload Image',
                              style:
                                  TextStyle(color: CustomColors.primaryBlack),
                            ),
                          ),
                        )
                      : Image.file(_image!),
                ),
              ),
              if (_image != null) ...[
                const SizedBox(height: 10),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColors.primaryWhite,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onPressed: _pickImage,
                    child: const Text(
                      'Change Image',
                      style: TextStyle(color: CustomColors.primaryBlack),
                    ),
                  ),
                ),
              ],
              const SizedBox(height: 15.0),
              Center(
                child: SizedBox(
                  width: 160, // Ensure enough width to accommodate the text
                  height: 40,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: CustomColors.primaryBlack,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0), // Adjust padding
                      side: const BorderSide(color: CustomColors.primaryBrown),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Try some images?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center, // Ensure text alignment
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40.0),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'ART STYLE',
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
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    border: Border.all(color: CustomColors.primaryBrown),
                  ),
                  padding: const EdgeInsets.all(16.0),
                ),
              ),
              const SizedBox(height: 15.0),
              Center(
                child: SizedBox(
                  width: 160, // Ensure enough width to accommodate the text
                  height: 40,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: CustomColors.primaryBlack,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0), // Adjust padding
                      side: const BorderSide(color: CustomColors.primaryBrown),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Change Art Style',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center, // Ensure text alignment
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40.0),
              const Text(
                'ART STYLE SIZE',
                style: TextStyle(
                  color: CustomColors.primaryWhite,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: CustomColors.primaryWhite,
                  inactiveTrackColor: CustomColors.primaryWhite,
                  thumbColor: CustomColors.primaryWhite,
                  overlayShape: null,
                  trackHeight: 1.0, // Set the track height (width)
                  thumbShape: CustomSliderThumbShape(
                      customThumbRadius: 8.0), // Set the custom thumb shape
                ),
                child: Slider(
                  value: 50,
                  min: 0,
                  max: 100,
                  divisions: 100,
                  onChanged: (value) {
                    // Add your onChanged code here!
                  },
                ),
              ),
              const SizedBox(height: 20.0),
              const Text(
                'STYLIZATION STRENGTH',
                style: TextStyle(
                  color: CustomColors.primaryWhite,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: CustomColors.primaryWhite,
                  inactiveTrackColor: CustomColors.primaryWhite,
                  thumbColor: CustomColors.primaryWhite,
                  overlayShape: null,
                  trackHeight: 1.0, // Set the track height (width)
                  thumbShape: CustomSliderThumbShape(
                      customThumbRadius: 8.0), // Set the custom thumb shape
                ),
                child: Slider(
                  value: 50,
                  min: 0,
                  max: 100,
                  divisions: 100,
                  onChanged: (value) {
                    // Add your onChanged code here!
                  },
                ),
              ),
              const SizedBox(height: 40.0),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StylizedImagePage(),
                      ),
                    );
                  },
                  child: const Text(
                    'STYLIZE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomSliderThumbShape extends RoundSliderThumbShape {
  final double customThumbRadius;

  CustomSliderThumbShape({required this.customThumbRadius});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(customThumbRadius);
  }
}
