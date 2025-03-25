import 'package:flutter/material.dart';

class StartRepairButton extends StatelessWidget {
  /// The text shown on the button (e.g., "Start Repair >>").
  final String text;

  /// The callback to be executed when the button is pressed.
  final VoidCallback? onPressed;

  /// The background color of the button.
  final Color backgroundColor;

  /// The text style for the button label.
  final TextStyle textStyle;

  /// Horizontal and vertical padding inside the button.
  final EdgeInsetsGeometry padding;

  /// Corner radius for the pill shape. StadiumBorder will automatically create
  /// a pill shape, but you can customize further if you prefer.
  final double cornerRadius;

  const StartRepairButton({
    super.key,
    this.text = "Start Repair >>",
    this.onPressed,
    this.backgroundColor = const Color(0xFFF75A5A), // example red
    this.textStyle = const TextStyle(
      color: Colors.white,
      fontSize: 23,
      fontWeight: FontWeight.bold,
    ),
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    this.cornerRadius = 60.0,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(cornerRadius),
        ),
        elevation: 2,
      ),
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}
