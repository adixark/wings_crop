import 'package:flutter/material.dart';
import 'package:wings_crop/core/responsive/breakpoints.dart';

extension SizeExtension on BuildContext {
  /// Size
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;

  double get statusBarHeight =>
      MediaQuery.of(this).padding.top; // time,battery,wifi area

  double get appBarHeight => kToolbarHeight; // 56.0 by default

  double get safeAreaTop =>
      MediaQuery.of(this).viewPadding.top; // Includes notch area

  /// Orientation
  bool get isPortrait =>
      MediaQuery.of(this).orientation == Orientation.portrait;
  bool get isLandScape =>
      MediaQuery.of(this).orientation == Orientation.landscape;

  // Check Device Type
  bool get isMobile => screenWidth < Breakpoints.mobile; // Mobile

  bool get isTablet =>
      screenWidth >= Breakpoints.mobile &&
      screenWidth < Breakpoints.tablet; // Tablet

  bool get isDesktop =>
      screenWidth >= Breakpoints.tablet &&
      screenWidth < Breakpoints.desktop; // Desktop

  bool get isUltraWide => screenWidth >= Breakpoints.desktop; // UltraWide
}
