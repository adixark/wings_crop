import 'package:flutter/material.dart';

class FaultWidget extends StatelessWidget {
  /// The number of total faults (e.g., 1, 2, 3).
  final int faultCount;

  /// The specific fault number to display (e.g., 1 for "01", 2 for "02").
  final int faultNumber;

  /// The main title of the fault (e.g., "High Throttle").
  final String faultTitle;

  /// A brief description of the fault (e.g., "Likely throttle connection or potentiometer issue").
  final String faultDescription;

  /// Callback when the "Troubleshoot" button is pressed.
  final VoidCallback? onTroubleshootPressed;

  /// The background color for the entire card.
  final Color backgroundColor;

  /// Corner radius for the rounded card edges.
  final double cornerRadius;

  /// Maximum width the widget can occupy.
  final double maxWidth;

  /// Maximum height the widget can occupy.
  final double maxHeight;

  const FaultWidget({
    super.key,
    required this.faultCount,
    required this.faultNumber,
    required this.faultTitle,
    required this.faultDescription,
    this.onTroubleshootPressed,
    this.backgroundColor = const Color(0xFFDCE3EC), // Example light gray-blue
    this.cornerRadius = 16.0,
    this.maxWidth = 600.0,
    this.maxHeight = 400.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6),
      height: maxHeight,
      width: maxWidth,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(cornerRadius),
      ),
      // Clip the corners so child content (e.g., the divider) respects the radius
      child: ClipRRect(
        borderRadius: BorderRadius.circular(cornerRadius),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- HEADER: FAULTS + count bubble ---
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'FAULTS',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Circle with the fault count
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      faultCount.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),

              // --- SPACING ---
              const SizedBox(height: 12),

              // --- WARNING ICON (centered) ---
              Center(
                child: Icon(
                  Icons.warning_amber,
                  size: 70,
                  color: Colors.red,
                ),
              ),

              // --- SPACING ---
              const SizedBox(height: 12),

              // --- SPACING ---
              const SizedBox(height: 8),

              // --- FAULT DETAILS ROW: numbered circle, text, and Troubleshoot button ---
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Circle with the fault number
                  Container(
                    width: 32,
                    height: 32,
                    decoration: const BoxDecoration(
                      color: Colors.redAccent,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      faultNumber < 10
                          ? '0$faultNumber'
                          : faultNumber.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Fault title & description
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          faultTitle,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          faultDescription,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // --- "Troubleshoot" button ---
                  const SizedBox(width: 12),
                  TextButton(
                    onPressed: onTroubleshootPressed,
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.redAccent,
                      side: const BorderSide(color: Colors.redAccent),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text('Troubleshoot'),
                  ),

                  // --- DIVIDER LINE ---
                  const Divider(
                    thickness: 1,
                    color: Colors.black12,
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
