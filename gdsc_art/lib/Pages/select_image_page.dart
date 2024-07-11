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
  bool _isStylizeClicked = false;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  double _primaryImageSize = 50.0;
  double _artStyleSize = 50.0;
  double _stylizationStrength = 50.0;

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
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 25),
                child: Text(
                  'Primary Image',
                  style: TextStyle(
                    color: CustomColors.primaryBrown,
                    fontFamily: "OutfitMedium",
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
                  width: 160,
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
              const SizedBox(height: 20.0),
              Center(
                child: SliderWithTitle(
                  title: 'PRIMARY IMAGE SIZE',
                  value: _primaryImageSize,
                  onChanged: (value) {
                    setState(() {
                      _primaryImageSize = value;
                    });
                  },
                  width: screenWidth * 0.80,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 40.0),
              const Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text(
                  'ART STYLE',
                  style: TextStyle(
                    color: CustomColors.primaryBrown,
                    fontFamily: "OutfitMedium",
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
              const SizedBox(height: 20.0),
              Center(
                child: SliderWithTitle(
                  title: 'ART STYLE SIZE',
                  value: _artStyleSize,
                  onChanged: (value) {
                    setState(() {
                      _artStyleSize = value;
                    });
                  },
                  width: screenWidth * 0.80,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 20.0),
              Center(
                child: SliderWithTitle(
                  title: 'STYLIZATION STRENGTH',
                  value: _stylizationStrength,
                  onChanged: (value) {
                    setState(() {
                      _stylizationStrength = value;
                    });
                  },
                  width: screenWidth * 0.80,
                  fontSize: 14,
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
                        horizontal: 38.0, vertical: 8.0), // Adjust padding
                  ),
                  onPressed: () {
                    setState(() {
                      _isStylizeClicked = true;
                    });
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
              if (_isStylizeClicked) StylizedImagePageContent()
            ],
          ),
        ),
      ),
    );
  }
}

class SliderWithTitle extends StatelessWidget {
  final String title;
  final double value;
  final ValueChanged<double> onChanged;
  final double width;
  final double fontSize;

  SliderWithTitle({
    required this.title,
    required this.value,
    required this.onChanged,
    required this.width,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            color: CustomColors.primaryWhite,
            fontWeight: FontWeight.bold,
            fontSize: fontSize,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          width: width,
          child: CustomSlider(
            value: value,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}

class CustomSlider extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;

  CustomSlider({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: CustomColors.primaryWhite,
        inactiveTrackColor: CustomColors.primaryWhite,
        thumbColor: CustomColors.primaryWhite,
        overlayShape: null,
        trackHeight: 1.0,
        thumbShape: CustomSliderThumbShape(customThumbRadius: 8.0),
      ),
      child: Slider(
        value: value,
        min: 0,
        max: 100,
        divisions: 100,
        onChanged: onChanged,
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
