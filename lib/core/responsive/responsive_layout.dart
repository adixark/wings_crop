import 'package:flutter/material.dart';
import 'package:wings_crop/core/core.dart';
import 'package:wings_crop/core/responsive/args_injector.dart';
import 'package:wings_crop/core/responsive/breakpoints.dart';

class ResponsiveLayout<T> extends StatefulWidget {
  final T args;
  final bool showFullScreenLoader;
  final bool isLoading;
  final Failure? error;
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;
  final Widget ultraWide;

  const ResponsiveLayout({
    required this.args,
    required this.mobile,
    required this.tablet,
    required this.desktop,
    required this.ultraWide,
    super.key,
    this.error,
    this.isLoading = false,
    this.showFullScreenLoader = false,
  });

  @override
  State<ResponsiveLayout<T>> createState() => _ResponsiveLayoutState<T>();
}

class _ResponsiveLayoutState<T> extends State<ResponsiveLayout<T>> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final deviceType = Breakpoints.getDeviceType(constraints.maxWidth);

      final Widget child = switch (deviceType) {
        DeviceType.mobile => KeyedSubtree(
            key: const ValueKey('mobile'),
            child: widget.mobile,
          ),
        DeviceType.tablet => KeyedSubtree(
            key: const ValueKey('tablet'),
            child: widget.tablet,
          ),
        DeviceType.desktop => KeyedSubtree(
            key: const ValueKey('desktop'),
            child: widget.desktop,
          ),
        DeviceType.ultraWide => KeyedSubtree(
            key: const ValueKey('ultraWide'),
            child: Center(
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: 1920, // Base design width for ultra-wide
                  maxHeight: 1080, // Base design height
                ),
                child: widget.ultraWide,
              ),
            ),
          ),
      };

      return Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: ArgsInjector<T>(
          args: widget.args,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            switchInCurve: Curves.easeIn,
            switchOutCurve: Curves.easeOut,
            transitionBuilder: (child, animation) => FadeTransition(
              opacity: animation,
              child: child,
            ),
            child: child,
          ),
        ),
      );
    });
  }
}
