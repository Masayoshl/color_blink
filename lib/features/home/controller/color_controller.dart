import 'package:color_blink/features/home/data/service/color_service_impl.dart';
import 'package:flutter/material.dart';

/// A controller that manages the background color state.
class ColorController extends ValueNotifier<Color> {
  final ColorServiceImpl _service;

  /// Creates a [ColorController] and initializes it with a random color
  /// from provided [ColorServiceImpl].
  ColorController(this._service) : super(_service.generate());

  /// Generates a new random color and updates the current value.
  void generate() {
    value = _service.generate();
  }
}
