import 'package:color_generator/color_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:random_color_generator/color_changer/color_changer.dart';

void main() {
  group('ColorChangerInitial', () {
    test('is ColorChangerState', () {
      expect(ColorChangerInitial(), isA<ColorChangerState>());
    });
  });

  group('ColorChangerChanged', () {
    final mockCustomColor = CustomColor.fromColor(Colors.red);

    test('is ColorChangerState', () {
      expect(
        ColorChangerChanged(mockCustomColor),
        isA<ColorChangerState>(),
      );
    });

    test('supports value comparisons', () {
      expect(
        ColorChangerChanged(mockCustomColor),
        ColorChangerChanged(mockCustomColor),
      );
    });
  });

  group('ColorChangerFailed', () {
    const mockMessage = 'message';

    test('is ColorChangerState', () {
      expect(
        ColorChangerFailed(mockMessage),
        isA<ColorChangerState>(),
      );
    });

    test('does not support value comparisons', () {
      expect(
        ColorChangerFailed(mockMessage),
        isNot(ColorChangerFailed(mockMessage)),
      );
    });
  });
}
