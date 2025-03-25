import 'dart:io' show Platform; // Import for native platform checks

import 'package:flutter/foundation.dart' show kIsWeb; // Import for kIsWeb

class Breakpoints {
  Breakpoints._();

  static const double mobile = 512;
  static const double tablet = 1024;
  static const double desktop = 1920;

  static DeviceType getDeviceType(double width) {
    if (!kIsWeb) {
      // Native platforms: Use Platform checks
      if (Platform.isAndroid || Platform.isIOS) {
        if (width < mobile) return DeviceType.mobile;
        if (width < tablet) return DeviceType.tablet;
        return DeviceType
            .desktop; // Android devices wider than tablet are treated as desktop
      } else {
        return DeviceType.desktop; // Default for other native platforms
      }
    } else {
      // Web: Use width-based logic only
      if (width < mobile) return DeviceType.mobile;
      if (width < tablet) return DeviceType.tablet;
      if (width < desktop) return DeviceType.desktop;
      return DeviceType.ultraWide;
    }
  }
}

enum DeviceType { mobile, tablet, desktop, ultraWide }
