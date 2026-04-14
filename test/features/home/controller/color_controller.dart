import 'package:color_blink/features/home/controller/color_controller.dart';
import 'package:color_blink/features/home/data/service/color_service_impl.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ColorController Tests', () {
    late ColorServiceImpl colorService;

    setUp(() {
      colorService = ColorServiceImpl();
    });

    test('Two different controllers should have different initial colors', () {
      final controller1 = ColorController(colorService);
      final controller2 = ColorController(colorService);

      expect(controller1.value, isNot(equals(controller2.value)));
    });

    test(
      '''Controller should update value and notify listeners when generate is called''',
      () {
        final controller = ColorController(colorService);
        final initialColor = controller.value;

        int listenerCount = 0;
        controller.addListener(() => listenerCount++);

        controller.generate();

        expect(controller.value, isNot(equals(initialColor)));
        expect(listenerCount, 1);
      },
    );
  });
}
