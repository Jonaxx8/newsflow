import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.color,
    required this.fontColor,
    this.imgPath,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final String? imgPath; // Updated to allow null values
  final Color color;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        // ignore: deprecated_member_use
        primary: color,
        // ignore: deprecated_member_use
        onPrimary: fontColor,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16), // Adjust the horizontal padding
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (imgPath != null) // Use conditional rendering to include the image if imgPath is not null
            Image.asset(
              imgPath!,
              width: 24,
              height: 24,
            ),
          if (imgPath != null) const SizedBox(width: 8),
          Text(text),
        ],
      ),
    );
  }
}
