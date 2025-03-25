import 'package:flutter/material.dart';

class BatteryInfoWidget extends StatelessWidget {
  /// Main display value, e.g. "56%" or "12V"
  final String mainValue;

  /// Label text, e.g. "STATE OF CHARGE" or "BATTERY VOLTAGE"
  final String label;

  /// Optional icon (e.g. a lightning bolt) to show to the left of [mainValue].
  /// If null, no icon is shown.
  final IconData? icon;

  /// The color used for the icon, if [icon] is provided.
  final Color? iconColor;

  /// Background color for the widget.
  final Color backgroundColor;

  /// Corner radius for rounding edges.
  final double cornerRadius;

  /// The maximum width this widget can occupy.
  final double maxWidth;

  /// The maximum height this widget can occupy.
  final double maxHeight;

  const BatteryInfoWidget({
    super.key,
    required this.mainValue,
    required this.label,
    this.icon,
    this.iconColor,
    this.backgroundColor = const Color(0xFFCBD4DF), // example light grey-blue
    this.cornerRadius = 12.0,
    this.maxWidth = 100.0,
    this.maxHeight = 100.0,
  });

  @override
  Widget build(BuildContext context) {
    // ConstrainedBox to ensure the widget does not exceed [maxWidth] / [maxHeight].
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: maxWidth,
        maxHeight: maxHeight,
      ),
      child: Container(
        margin: EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(cornerRadius),
        ),
        // ClipRRect to ensure content (like the icon) respects the corner radius
        child: ClipRRect(
          borderRadius: BorderRadius.circular(cornerRadius),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Row for optional icon + mainValue
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (icon != null) ...[
                      Icon(
                        icon,
                        color: iconColor ?? Colors.black,
                        size: 20,
                      ),
                      const SizedBox(width: 4),
                    ],
                    Text(
                      mainValue,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),

                // Label (e.g. "STATE OF CHARGE" or "BATTERY VOLTAGE")
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
