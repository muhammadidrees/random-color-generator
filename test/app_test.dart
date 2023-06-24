import 'package:flutter_test/flutter_test.dart';

import 'package:random_color_generator/app/app.dart';
import 'package:random_color_generator/color_changer/color_changer.dart';
import 'helpers/helpers.dart';

void main() {
  group('App', () {
    testWidgets('renders AppView', (tester) async {
      await tester.pumpApp(
        const App(),
      );
      expect(find.byType(ColorChangerScreen), findsOneWidget);
    });
  });
}
