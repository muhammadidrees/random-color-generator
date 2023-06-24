import 'package:color_generator/color_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:random_color_generator/color_changer/color_changer.dart';

import '../../helpers/helpers.dart';

const text = "Hello there";
const coloredContentKey = Key('colored-content');

void main() {
  late MockVoidCallback mockOnTap;
  const color = Colors.red;
  final mockColor = CustomColor.fromColor(color);

  setUp(() {
    mockOnTap = MockVoidCallback();
  });

  group('TappableColoredwidget', () {
    group('renders', () {
      testWidgets('properly with the color provided', (tester) async {
        await tester.pumpApp(
          TappableColoredWidget(
            customColor: mockColor,
            onTap: mockOnTap,
          ),
        );
        expect(find.byKey(coloredContentKey), findsOneWidget);
        expect(find.text(text), findsOneWidget);

        final decoration = tester
            .firstWidget<AnimatedContainer>(find.byKey(coloredContentKey))
            .decoration as BoxDecoration?;

        expect(decoration?.color, mockColor.color);

        final textStyle = tester.firstWidget<Text>(find.text(text)).style;

        expect(textStyle?.color, mockColor.contrast);
      });

      testWidgets(
          'with defaultColor coloredContent if customColor'
          'is not provided', (tester) async {
        await tester.pumpApp(
          TappableColoredWidget(onTap: mockOnTap),
        );

        expect(find.byKey(coloredContentKey), findsOneWidget);
        expect(find.text(text), findsOneWidget);

        final decoration = tester
            .firstWidget<AnimatedContainer>(find.byKey(coloredContentKey))
            .decoration as BoxDecoration?;

        expect(
          decoration?.color,
          TappableColoredWidget.defaultColor.color,
        );

        final textStyle = tester.firstWidget<Text>(find.text(text)).style;

        expect(
          textStyle?.color,
          TappableColoredWidget.defaultColor.contrast,
        );
      });
    });

    group('calls', () {
      testWidgets('onTap when tapped', (tester) async {
        await tester.pumpApp(
          TappableColoredWidget(
            customColor: mockColor,
            onTap: mockOnTap,
          ),
        );

        await tester.tap(find.byKey(coloredContentKey));
        expect(mockOnTap.called(1), true);
      });
    });
  });
}
