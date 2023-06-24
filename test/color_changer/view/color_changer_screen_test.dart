import 'package:flutter_test/flutter_test.dart';
import 'package:random_color_generator/color_changer/color_changer.dart';

import '../../helpers/helpers.dart';

void main() {
  group('ColorChangerScreen', () {
    group('renders', () {
      testWidgets('ColorChangerView', (tester) async {
        await tester.pumpApp(const ColorChangerScreen());
      });
    });
  });
}
