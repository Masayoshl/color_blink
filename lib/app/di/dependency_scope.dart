import 'package:color_blink/app/di/color_controller_injector.dart';
import 'package:color_blink/features/home/controller/color_controller.dart';
import 'package:color_blink/features/home/data/service/color_service_impl.dart';
import 'package:flutter/material.dart';

/// A widget that manages the lifecycle of the [ColorController].
///
/// It creates the controller instance and provides it to the widget tree
/// using [ColorControllerInjector].
class DependencyScope extends StatefulWidget {
  /// Creates a dependency scope that wraps the [child] widget.
  const DependencyScope({
    required this.child,
    super.key,
  });

  /// The widget subtree that will have access to the dependencies.
  final Widget child;

  @override
  State<DependencyScope> createState() => _DependencyScopeState();
}

class _DependencyScopeState extends State<DependencyScope> {
  final ColorController _colorController = ColorController(ColorServiceImpl());

  @override
  Widget build(BuildContext context) {
    return ColorControllerInjector(
      colorController: _colorController,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _colorController.dispose();
    super.dispose();
  }
}
