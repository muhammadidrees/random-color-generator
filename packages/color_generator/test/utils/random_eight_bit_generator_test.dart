import 'dart:math';

import 'package:color_generator/src/utils/utils.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRandom extends Mock implements Random {}

const eightBitMaxValue = 255;

void main() {
  final Random random = MockRandom();
  const mockRandomNumber = 42;

  group("RandomEightBitGenerator", () {
    RandomEightBitGenerator createGenerator() {
      return RandomEightBitGenerator(random);
    }

    group('initializes', () {
      test('without parameters', () {
        final generator = RandomEightBitGenerator();
        expect(generator, isA<RandomEightBitGenerator>());
      });
    });

    group('eightBitMaxValue', () {
      test('is setup with the correct value', () {
        expect(
          RandomEightBitGenerator.eightBitMaxValue,
          eightBitMaxValue,
        );
      });
    });

    group('generate()', () {
      test("generates a random 8-bit integer", () {
        when(() => random.nextInt(eightBitMaxValue))
            .thenReturn(mockRandomNumber);

        final generator = createGenerator();
        final value = generator.generate();

        expect(value, mockRandomNumber);

        verify(() => random.nextInt(eightBitMaxValue)).called(1);
      });
    });
  });
}
