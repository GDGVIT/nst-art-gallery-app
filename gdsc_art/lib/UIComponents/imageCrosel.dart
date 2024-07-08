import 'package:flutter/material.dart';
import 'package:overlapped_carousel/overlapped_carousel.dart';

class CustomImageSlider extends StatefulWidget {
  final double width;
  final double height;
  final List<Widget> widgets;
  final int currentIndex;
  final Function(int) onClicked;
  final double obscure;
  final double skewAngle;

  const CustomImageSlider({
    Key? key,
    required this.width,
    required this.height,
    required this.widgets,
    this.currentIndex = 1,
    required this.onClicked,
    this.obscure = 0.4,
    this.skewAngle = 0.25,
  }) : super(key: key);

  @override
  _CustomImageSliderState createState() => _CustomImageSliderState();
}

class _CustomImageSliderState extends State<CustomImageSlider> {
  late double currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex.toDouble();
  }

  void updateIndex(double index) {
    setState(() {
      currentIndex = index;
    });
    widget.onClicked(index.toInt());
  }

  void moveLeft() {
    if (currentIndex > 0) {
      updateIndex(currentIndex - 1);
    }
  }

  void moveRight() {
    if (currentIndex < widget.widgets.length - 1) {
      updateIndex(currentIndex + 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: screenWidth / 3.3 * (16 / 9),
          width: screenHeight * 100,
          child: GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                var indx = currentIndex - details.delta.dx * 0.02;
                if (indx >= 0 && indx <= widget.widgets.length - 1) {
                  currentIndex = indx;
                }
              });
            },
            onPanEnd: (details) {
              setState(() {
                currentIndex = currentIndex.roundToDouble();
              });
              widget.onClicked(currentIndex.toInt());
            },
            child: OverlappedCarousel(
              widgets: widget.widgets,
              currentIndex: currentIndex.toInt(),
              onClicked: (index) {
                setState(() {
                  currentIndex = index.toDouble();
                });
                widget.onClicked(index);
              },
              obscure: widget.obscure,
              skewAngle: widget.skewAngle,
            ),
          ),
        ),
        Positioned(
          left: 10,
          child: IconButton(
            icon: Icon(Icons.arrow_left, color: Colors.white, size: 40),
            onPressed: moveLeft,
          ),
        ),
        Positioned(
          right: 10,
          child: IconButton(
            icon: Icon(Icons.arrow_right, color: Colors.white, size: 40),
            onPressed: moveRight,
          ),
        ),
      ],
    );
  }
}
