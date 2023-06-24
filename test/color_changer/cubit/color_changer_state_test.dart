import 'package:color_generator/color_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:random_color_generator/color_changer/color_changer.dart';

void main() {
  group('ColorChangerInitial', () {
    ColorChangerInitial createState() => const ColorChangerInitial();

    test('is ColorChangerState', () {
      expect(createState(), isA<ColorChangerState>());
    });
  });

  group('ColorChangerChanged', () {
    final mockCustomColor = CustomColor.fromColor(Colors.red);

    ColorChangerChanged createState() => ColorChangerChanged(mockCustomColor);

    test('is ColorChangerState', () {
      expect(createState(), isA<ColorChangerState>());
    });

    test('supports value comparisons', () {
      expect(createState(), createState());
    });
  });

  group('ColorChangerFailed', () {
    const mockMessage = 'message';

    // ignore: prefer_const_constructors
    ColorChangerFailed createState() => ColorChangerFailed(mockMessage);

    test('is ColorChangerState', () {
      expect(createState(), isA<ColorChangerState>());
    });

    test('does not support value comparisons', () {
      expect(createState(), isNot(createState()));
    });
  });
}
