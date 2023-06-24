import 'package:color_generator/color_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const darkColor = Color(0xFF000000);
  const darkContrastColor = Color(0xFFFFFFFF);
  const lightColor = Color(0xFFFFFFFF);
  const lightContrastColor = Color(0xFF000000);

  group('CustomColor', () {
    group('.fromColor', () {
      test('generate darkContrastColor when provided color is darkColor', () {
        final color = CustomColor.fromColor(darkColor);
        expect(color.color, darkColor);
        expect(color.contrast, darkContrastColor);
      });

      test('generate lightContrastColor when provided color is lightColor', () {
        final color = CustomColor.fromColor(lightColor);
        expect(color.color, lightColor);
        expect(color.contrast, lightContrastColor);
      });
    });

    group('supports value equality', () {
      test('when created with same values', () {
        final color1 = CustomColor.fromColor(darkColor);
        final color2 = CustomColor.fromColor(darkColor);
        expect(color1, color2);
      });

      test('when creted with different values', () {
        final color1 = CustomColor.fromColor(darkColor);
        final color2 = CustomColor.fromColor(lightColor);
        expect(color1, isNot(color2));
      });
    });
  });
}
