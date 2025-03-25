import 'package:flutter/material.dart';

class BikeShowcaseWidget extends StatelessWidget {
  /// The status text (e.g., "ARMED", "DISARMED", etc.).
  final String status;

  /// The color used for the status indicator dot.
  /// Example: Colors.green for "ARMED".
  final Color statusColor;

  /// The main title for the bike (e.g., "2024 DSR/X").
  final String bikeTitle;

  /// A subtitle or category for the bike (e.g., "Dual Sport").
  final String bikeSubtitle;

  /// The VIN for the bike.
  final String vin;

  /// The path to the bike image.
  /// - If [isFromAsset] is true, this should be an asset path (e.g. "assets/images/bike.png").
  /// - If [isFromAsset] is false, this should be a valid network URL.
  final String imagePath;

  /// Indicates whether [imagePath] is an asset path or a network URL.
  final bool isFromAsset;

  /// The background color for the entire widget area.
  final Color backgroundColor;

  /// The border radius for the rounded corners.
  final double cornerRadius;

  /// The maximum width this widget can occupy.
  final double maxWidth;

  /// The maximum height this widget can occupy.
  final double maxHeight;

  const BikeShowcaseWidget({
    super.key,
    required this.status,
    required this.statusColor,
    required this.bikeTitle,
    required this.bikeSubtitle,
    required this.vin,
    required this.imagePath,
    this.isFromAsset = false,
    this.backgroundColor = const Color(0xFF48505E), // Example dark gray/blue
    this.cornerRadius = 16.0, // Default corner radius
    this.maxWidth = 600.0, // Default maximum width
    this.maxHeight = 400.0, // Default maximum height
  });

  @override
  Widget build(BuildContext context) {
    // We constrain the widget’s maximum size using ConstrainedBox
    return Container(
      constraints: BoxConstraints(
        maxWidth: maxWidth,
        maxHeight: maxHeight,
      ),
      margin: EdgeInsets.all(6),
      // Use BoxDecoration to add a background color + rounded corners
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(cornerRadius),
      ),
      // ClipRRect ensures that child content also respects the corner radius
      child: ClipRRect(
        borderRadius: BorderRadius.circular(cornerRadius),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row for the status dot and text (e.g. "ARMED")
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Dot
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: statusColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    status,
                    style: TextStyle(
                      color: statusColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Bike image (either from asset or network)
              Expanded(
                flex: 5,
                child: Center(
                  child: isFromAsset
                      ? Image.asset(
                          imagePath,
                          fit: BoxFit.contain,
                        )
                      : Image.network(
                          imagePath,
                          fit: BoxFit.contain,
                        ),
                ),
              ),
              const SizedBox(height: 16),

              // Text: Bike Title
              Text(
                bikeTitle,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),

              // Row with the subtitle and VIN
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    bikeSubtitle,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    'VIN: $vin',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
