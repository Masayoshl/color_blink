import 'package:color_blink/app/di/color_controller_injector.dart';

import 'package:color_blink/features/home/ui/widgets/centered_text.dart';
import 'package:color_blink/features/home/ui/widgets/copy_color_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// The main landing page of the application.
class HomePage extends StatelessWidget {
  /// Creates the [HomePage] widget.
  const HomePage({super.key});

  /// The curve used for color transition animations.
  static const animationCurve = Curves.easeInOutCubic;

  /// The duration used for color transition animations.
  static const animationDuration = Durations.medium2;

  @override
  Widget build(BuildContext context) {
    final colorController = ColorControllerInjector.of(context);

    return ValueListenableBuilder<Color>(
      valueListenable: colorController,
      builder: (_, newColor, _) {
        return TweenAnimationBuilder<Color?>(
          duration: animationDuration,
          curve: animationCurve,
          tween: ColorTween(end: newColor),
          builder: (_, animatedColor, _) {
            final currentColor = animatedColor ?? newColor;

            return Scaffold(
              backgroundColor: currentColor,
              floatingActionButton: CopyColorActionButton(
                currentColor: currentColor,
              ),
              body: GestureDetector(
                onTap: () {
                  HapticFeedback.lightImpact();
                  colorController.generate();
                },
                behavior: HitTestBehavior.opaque,
                child: CenteredText(
                  curve: animationCurve,
                  animationDuration: animationDuration,
                  currentColor: currentColor,
                  text: 'Hello there',
                ),
              ),
            );
          },
        );
      },
    );
  }
}
