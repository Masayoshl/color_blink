import 'dart:ui';

/// Extensions for [Color] to provide additional formatting capabilities.
extension ColorHexExtension on Color {
  /// Converts the color to a hex string representation.
  ///
  /// Returns a string in the format '#RRGGBB' in uppercase.
  String toHex() {
    final String fullHex = toARGB32().toRadixString(16).padLeft(8, '0');
    final String rgbHex = fullHex.substring(2);

    return '#${rgbHex.toUpperCase()}';
  }
}
