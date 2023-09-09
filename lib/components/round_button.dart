import 'package:flutter/material.dart';
class RoundButton extends StatelessWidget {
  final String imageAsset;
  final VoidCallback onPressed;
  final double screenWidth; // Declare screenWidth as a property

  const RoundButton({super.key, required this.imageAsset, required this.onPressed, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(50.0),
      child: Container(
        width: screenWidth * 0.15,
        height: screenWidth * 0.15,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(color: Colors.grey, width: 2.0),
        ),
        child: Center(
          child: Image.asset(
            imageAsset,
            width: screenWidth * 0.075,
            height: screenWidth * 0.075,
          ),
        ),
      ),
    );
  }
}