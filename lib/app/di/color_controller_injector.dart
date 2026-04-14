import 'package:color_blink/features/home/controller/color_controller.dart';
import 'package:flutter/material.dart';

/// An [InheritedWidget] that provides [ColorController] to the widget tree.
class ColorControllerInjector extends InheritedWidget {
  /// Creates an injector for the given [colorController].
  const ColorControllerInjector({
    required this.colorController,
    required super.child,
    super.key,
  });

  /// The instance of [ColorController] shared across the subtree.
  final ColorController colorController;

  /// Retrieves the [ColorController] from the nearest [ColorControllerInjector]
  /// up the widget tree.
  ///
  /// Throws a [FlutterError] if the injector is not found in the [context].
  static ColorController of(BuildContext context) {
    final result = context
        .dependOnInheritedWidgetOfExactType<ColorControllerInjector>();

    if (result == null) {
      throw FlutterError('ColorControllerInjector not found in context');
    }

    return result.colorController;
  }

  @override
  bool updateShouldNotify(ColorControllerInjector oldWidget) =>
      colorController != oldWidget.colorController;
}
