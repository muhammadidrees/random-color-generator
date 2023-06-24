import 'package:bloc_test/bloc_test.dart';
import 'package:color_generator/color_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:random_color_generator/color_changer/color_changer.dart';

class MockColorGenerator extends Mock implements ColorGenerator {}

void main() {
  late ColorGenerator mockColorGenerator;
  final mockColor = CustomColor.fromColor(Colors.red);
  const mockMessage = 'error';
  final mockException = Exception(mockMessage);

  setUp(() {
    mockColorGenerator = MockColorGenerator();
  });

  group('ColorChagnerCubit', () {
    ColorChangerCubit createCubit() => ColorChangerCubit(mockColorGenerator);

    group('initial state', () {
      test('is ColorChangerInitial', () {
        expect(createCubit().state, const ColorChangerInitial());
      });
    });

    group('changeColor', () {
      blocTest<ColorChangerCubit, ColorChangerState>(
        'emits [ColorChangerState(color)] '
        'when ColorGenerator.generateColor succeeds',
        build: createCubit,
        setUp: () => when(() => mockColorGenerator.generateColor())
            .thenReturn(mockColor),
        act: (cubit) => cubit.changeColor(),
        expect: () => [ColorChangerChanged(mockColor)],
        verify: (_) {
          verify(() => mockColorGenerator.generateColor()).called(1);
        },
      );

      blocTest<ColorChangerCubit, ColorChangerState>(
        'emits [ColorChangerState.failed(message)] '
        'when ColorGenerator.generateColor fails',
        build: createCubit,
        setUp: () => when(() => mockColorGenerator.generateColor())
            .thenThrow(mockException),
        act: (cubit) => cubit.changeColor(),
        expect: () => [isA<ColorChangerFailed>()],
        verify: (_) {
          verify(() => mockColorGenerator.generateColor()).called(1);
        },
      );

      blocTest<ColorChangerCubit, ColorChangerState>(
        'emits [ColorChangerState.failed(message)] '
        'when previous state is ColorChangerFailed '
        'and ColorGenerator.generateColor fails with same message',
        build: createCubit,
        seed: () => const ColorChangerFailed(mockMessage),
        setUp: () => when(() => mockColorGenerator.generateColor())
            .thenThrow(mockException),
        act: (cubit) => cubit.changeColor(),
        expect: () => [isA<ColorChangerFailed>()],
        verify: (_) {
          verify(() => mockColorGenerator.generateColor()).called(1);
        },
      );
    });
  });
}
