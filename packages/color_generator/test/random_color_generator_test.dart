import 'package:color_generator/color_generator.dart';
import 'package:color_generator/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRandomEightBitGenerator extends Mock
    implements RandomEightBitGenerator {}

void main() {
  final RandomEightBitGenerator randomEightBitGenerator =
      MockRandomEightBitGenerator();

  const mockBits = 0;
  const expectedColor = Color.fromARGB(255, 0, 0, 0);

  group('RandomColorGenerator', () {
    RandomColorGenerator colorGenerator() =>
        RandomColorGenerator(randomEightBitGenerator);

    test('is of type ColorGenerator', () {
      expect(colorGenerator(), isA<ColorGenerator>());
    });

    group('initializes', () {
      test('without parameters', () {
        final generator = RandomColorGenerator();
        expect(generator, isA<RandomColorGenerator>());
      });
    });

    group('generateColor()', () {
      test('generates a CustomColor', () {
        when(() => randomEightBitGenerator.generate()).thenReturn(1);
        final color = colorGenerator().generateColor();
        expect(color, isA<CustomColor>());
      });

      test('generates expectedColor when mockBits are generated', () {
        when(() => randomEightBitGenerator.generate()).thenReturn(mockBits);
        final color = colorGenerator().generateColor();
        expect(color.color, expectedColor);
      });
    });
  });
}
