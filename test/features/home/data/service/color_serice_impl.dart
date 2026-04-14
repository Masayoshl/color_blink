import 'package:color_blink/features/home/data/service/color_service_impl.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ColorServiceImpl Test', () {
    late ColorServiceImpl colorService;

    setUp(() {
      colorService = ColorServiceImpl();
    });

    test('generate should produce different colors over multiple calls', () {
      final color1 = colorService.generate();
      final color2 = colorService.generate();
      expect(color1, isNot(equals(color2)));
    });
  });
}
