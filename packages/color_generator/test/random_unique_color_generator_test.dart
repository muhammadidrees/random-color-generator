import 'package:color_generator/color_generator.dart';
import 'package:color_generator/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockColorCache extends Mock implements ColorCache {}

class MockRandomColorGenerator extends Mock implements RandomColorGenerator {}

void main() {
  late RandomColorGenerator randomColorGenerator;
  late ColorCache colorCache;
  const maxTries = 2;

  final customColor1 =
      CustomColor.fromColor(const Color.fromARGB(255, 0, 0, 0));
  final customColor2 =
      CustomColor.fromColor(const Color.fromARGB(255, 0, 0, 1));

  setUp(() {
    randomColorGenerator = MockRandomColorGenerator();
    colorCache = MockColorCache();
  });

  group('RandomUniqueColorGenerator', () {
    RandomUniqueColorGenerator colorGenerator() => RandomUniqueColorGenerator(
          randomColorGenerator: randomColorGenerator,
          colorCache: colorCache,
          maxTries: maxTries,
        );

    test('is of type ColorGenerator', () {
      expect(colorGenerator(), isA<ColorGenerator>());
    });

    group('initializes', () {
      test('without parameters', () {
        final generator = RandomUniqueColorGenerator();
        expect(generator, isA<RandomUniqueColorGenerator>());
      });

      test('with defaultMaxTries if not provided', () {
        final generator = RandomUniqueColorGenerator();
        expect(generator.maxTries, RandomUniqueColorGenerator.defaultMaxTries);
      });
    });

    group('generateColor()', () {
      test('generates a CustomColor and adds to cache', () {
        when(() => randomColorGenerator.generateColor())
            .thenReturn(customColor1);
        when(() => colorCache.contains(customColor1)).thenReturn(false);

        final color = colorGenerator().generateColor();
        expect(color, isA<CustomColor>());
        verify(() => colorCache.add(customColor1)).called(1);
      });

      test('throws MaxTriesExceededException if no unique color is generated',
          () {
        when(() => randomColorGenerator.generateColor())
            .thenReturn(customColor1);
        when(() => colorCache.contains(customColor1)).thenReturn(true);

        expect(
          () => colorGenerator().generateColor(),
          throwsA(isA<MaxTriesExceededException>()),
        );

        verify(() => randomColorGenerator.generateColor()).called(maxTries);
        verifyNever(() => colorCache.add(customColor1));
      });

      test('return customColor2 if customColor1 is already in cache', () {
        final List<CustomColor Function()> answers = [
          () => customColor1,
          () => customColor2,
        ];

        when(() => randomColorGenerator.generateColor())
            .thenAnswer((_) => answers.removeAt(0)());

        when(() => colorCache.contains(customColor1)).thenReturn(true);
        when(() => colorCache.contains(customColor2)).thenReturn(false);

        final color = colorGenerator().generateColor();
        expect(color, customColor2);
        verify(() => colorCache.add(customColor2)).called(1);
        verifyNever(() => colorCache.add(customColor1));
      });
    });
  });
}
