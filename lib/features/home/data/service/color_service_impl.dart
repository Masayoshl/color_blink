import 'dart:math';
import 'dart:ui';

/// Service that generates random colors.
class ColorServiceImpl {
  final _random = Random();

  /// Maximum value for a color channel (0 <= 255 < 256).
  static const _channelRange = 256;

  /// Default alpha value for fully opaque colors.
  static const _fullOpacity = 255;

  /// Generates and returns a new [Color].
  Color generate() {
    return Color.fromARGB(
      _fullOpacity,
      _random.nextInt(_channelRange),
      _random.nextInt(_channelRange),
      _random.nextInt(_channelRange),
    );
  }
}
