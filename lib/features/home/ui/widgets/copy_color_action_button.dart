import 'package:color_blink/app/extension/color_hex_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A button that copies the HEX representation of
/// the [currentColor] to the clipboard.
///
class CopyColorActionButton extends StatelessWidget {
  /// Creates a [CopyColorActionButton] for the given [currentColor].
  const CopyColorActionButton({
    required this.currentColor,
    super.key,
  });

  /// The color to be formatted and copied.
  final Color currentColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Theme(
      data: theme.copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: currentColor),
      ),
      child: FloatingActionButton.extended(
        elevation: 1,
        tooltip: 'Copy current color to clipboard',
        onPressed: () => _onPressed(context),
        label: const Text('Copy'),
        icon: const Icon(Icons.copy),
      ),
    );
  }

  Future<void> _onPressed(BuildContext context) async {
    final hex = currentColor.toHex();

    await Clipboard.setData(ClipboardData(text: hex));

    if (!context.mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Color Successfully copied to clipboard')),
    );
  }
}
