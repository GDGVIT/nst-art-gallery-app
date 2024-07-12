import 'package:flutter/material.dart';
import 'package:gdsc_artwork/Constants/Colors.dart';

class TextFieldComponent extends StatelessWidget {
  final String labelText;

  TextFieldComponent({required this.labelText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width * 0.75,
      child: TextField(
        decoration: InputDecoration(
          labelText: labelText,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: CustomColors.primaryBrown),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: CustomColors.primaryBrown),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
