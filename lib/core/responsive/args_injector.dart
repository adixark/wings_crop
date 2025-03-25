import 'package:flutter/material.dart';

extension ArgsInjectorExtension on BuildContext {
  T args<T>() => ArgsInjector.of<T>(this);
}

class ArgsInjector<T> extends InheritedWidget {
  final T args;

  const ArgsInjector({
    super.key,
    required this.args,
    required super.child,
  });

  static T of<T>(BuildContext context) {
    final injector =
        context.dependOnInheritedWidgetOfExactType<ArgsInjector<T>>();
    assert(injector != null, 'No _ArgsInjector found in context');
    return injector!.args;
  }

  @override
  bool updateShouldNotify(ArgsInjector oldWidget) => oldWidget.args != args;
}
