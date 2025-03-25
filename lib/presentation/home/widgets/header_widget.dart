import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  /// Which nav item is currently active?
  /// 0 => DASHBOARD, 1 => FEEDBACK, 2 => SETTINGS
  final int activeIndex;

  /// Callback when a nav item is tapped.
  final ValueChanged<int>? onNavItemSelected;

  const CustomHeader({
    super.key,
    this.activeIndex = 0,
    this.onNavItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      // Use Material if you want a shadow or a bottom divider
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Top row: logo + nav items
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Left circular logo/icon
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  // If you have an actual logo image, you can replace with Image.asset(...)
                  child: const Center(
                    child: Icon(
                      Icons.stop, // Example placeholder icon
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
                const SizedBox(width: 32),

                // Nav items
                _buildNavItem(
                  label: 'DASHBOARD',
                  index: 0,
                  isActive: activeIndex == 0,
                ),
                const SizedBox(width: 24),
                _buildNavItem(
                  label: 'FEEDBACK',
                  index: 1,
                  isActive: activeIndex == 1,
                ),
                const SizedBox(width: 24),
                _buildNavItem(
                  label: 'SETTINGS',
                  index: 2,
                  isActive: activeIndex == 2,
                ),
                // Spacer to push nav items left, if desired
                const Spacer(),
              ],
            ),
          ),

          // Bottom divider line
          Container(
            height: 2,
            color: Colors.grey.shade200,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required String label,
    required int index,
    required bool isActive,
  }) {
    final activeColor = Colors.orange; // Active label color
    final inactiveColor = Colors.black87;

    return InkWell(
      onTap: () => onNavItemSelected?.call(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: isActive ? activeColor : inactiveColor,
            ),
          ),
          // Orange underline if active
          if (isActive)
            Container(
              margin: const EdgeInsets.only(top: 4),
              height: 2,
              width: 100,
              color: activeColor,
            )
        ],
      ),
    );
  }
}
