import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb; // Import for kIsWeb
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'package:wings_crop/app_widget.dart';
import 'package:wings_crop/core/injection/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencies();
  await windowsConfigForDesktop();

  runApp(AppWidget());
}

Future<void> windowsConfigForDesktop() async {
  if (!kIsWeb && (Platform.isWindows || Platform.isMacOS || Platform.isLinux)) {
    await WindowManager.instance.ensureInitialized();

    getIt.registerSingleton<WindowManager>(WindowManager.instance);
    // Set window options
    final windowOptions = WindowOptions(
      center: true,
      minimumSize: Size(720, 540),
      backgroundColor: Colors.white,
      skipTaskbar: false,
      title: 'Wings Corp',
      titleBarStyle: TitleBarStyle.normal,
    );

    // Wait until the window is ready to show
    await windowManager.waitUntilReadyToShow(windowOptions, () async {
      // Show the window
      await windowManager.show();
      // Focus the window
      await windowManager.focus();
    });
  }
}
