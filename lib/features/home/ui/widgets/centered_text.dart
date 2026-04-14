import 'package:flutter/material.dart';

/// A widget that displays a centered text label with adaptive coloring.
///
///
class CenteredText extends StatelessWidget {
  /// Creates a [CenteredText] widget.
  const CenteredText({
    required this.curve,
    required this.animationDuration,
    required this.currentColor,
    required this.text,
    super.key,
  });

  /// The curve of the text style transition.
  final Curve curve;

  /// The duration of the text style transition.
  final Duration animationDuration;

  /// The background color used to calculate the contrasting text color.
  final Color currentColor;

  /// The string content to display.
  final String text;

  @override
  Widget build(BuildContext context) {
    const textSize = 28.0;
    final textColor = currentColor.computeLuminance() > 0.5
        ? Colors.black
        : Colors.white;

    final style = TextStyle(
      color: textColor,
      fontSize: textSize,
      fontWeight: FontWeight.bold,
    );

    return Center(
      child: AnimatedDefaultTextStyle(
        curve: curve,
        duration: animationDuration,

        style: style,

        child: Text(
          text,
        ),
      ),
    );
  }
}
