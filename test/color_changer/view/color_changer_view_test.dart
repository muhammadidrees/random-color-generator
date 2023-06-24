import 'package:bloc_test/bloc_test.dart';
import 'package:color_generator/color_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:random_color_generator/color_changer/color_changer.dart';

import '../../helpers/helpers.dart';

class MockCounterChangerCubit extends MockCubit<ColorChangerState>
    implements ColorChangerCubit {}

void main() {
  late MockCounterChangerCubit mockCounterChangerCubit;
  final mockColor = CustomColor.fromColor(Colors.red);
  const mockMessage = 'message';

  setUp(() {
    mockCounterChangerCubit = MockCounterChangerCubit();
  });

  group('ColorChangerView', () {
    group('renders', () {
      testWidgets(
          'TappableColoredWidget with default color '
          'when state is ColorChangeInitial', (tester) async {
        when(() => mockCounterChangerCubit.state).thenReturn(
          const ColorChangerInitial(),
        );

        await tester.pumpAppWithCubit<ColorChangerCubit>(
          home: const ColorChangerView(),
          cubit: mockCounterChangerCubit,
        );

        final finder = find.byType(TappableColoredWidget);

        expect(finder, findsOneWidget);

        final colorWidget = tester.widget<TappableColoredWidget>(finder);

        expect(colorWidget.customColor, TappableColoredWidget.defaultColor);
      });

      testWidgets(
          'TappableColoredWidget with default color '
          'when state is ColorChangerFailed', (tester) async {
        when(() => mockCounterChangerCubit.state).thenReturn(
          const ColorChangerFailed(mockMessage),
        );

        await tester.pumpAppWithCubit<ColorChangerCubit>(
          home: const ColorChangerView(),
          cubit: mockCounterChangerCubit,
        );

        final finder = find.byType(TappableColoredWidget);

        expect(finder, findsOneWidget);

        final colorWidget = tester.widget<TappableColoredWidget>(finder);

        expect(colorWidget.customColor, TappableColoredWidget.defaultColor);
      });

      testWidgets(
          'properly with color'
          'when state is ColorChangerChanged(color)', (tester) async {
        when(() => mockCounterChangerCubit.state).thenReturn(
          ColorChangerChanged(mockColor),
        );

        await tester.pumpAppWithCubit<ColorChangerCubit>(
          home: const ColorChangerView(),
          cubit: mockCounterChangerCubit,
        );

        final finder = find.byType(TappableColoredWidget);

        expect(finder, findsOneWidget);

        final colorWidget = tester.widget<TappableColoredWidget>(finder);

        expect(colorWidget.customColor, mockColor);
      });

      testWidgets(
          'Snackbar with message '
          'when state changes to ColorChangerFailed(message)', (tester) async {
        whenListen(
          mockCounterChangerCubit,
          Stream.fromIterable(
            [const ColorChangerFailed(mockMessage)],
          ),
          initialState: const ColorChangerInitial(),
        );

        await tester.pumpAppWithCubit<ColorChangerCubit>(
          home: const ColorChangerView(),
          cubit: mockCounterChangerCubit,
        );
        await tester.pump();

        expect(find.byType(SnackBar), findsOneWidget);
        expect(find.text(mockMessage), findsOneWidget);
      });
    });

    group('calls', () {
      testWidgets('changeColor when TappableColoredWidget is tapped',
          (tester) async {
        when(() => mockCounterChangerCubit.state).thenReturn(
          const ColorChangerInitial(),
        );

        await tester.pumpAppWithCubit<ColorChangerCubit>(
          home: const ColorChangerView(),
          cubit: mockCounterChangerCubit,
        );

        final finder = find.byType(TappableColoredWidget);

        expect(finder, findsOneWidget);

        await tester.tap(finder);
        verify(() => mockCounterChangerCubit.changeColor()).called(1);
      });
    });
  });
}
