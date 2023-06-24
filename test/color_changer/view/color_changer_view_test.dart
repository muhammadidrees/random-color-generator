import 'package:bloc_test/bloc_test.dart';
import 'package:color_generator/color_generator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:random_color_generator/color_changer/color_changer.dart';

import '../../helpers/helpers.dart';

class MockColorGenerator extends Mock implements ColorGenerator {}

class MockCounterChangerCubit extends MockCubit<ColorChangerState>
    implements ColorChangerCubit {}

void main() {
  late ColorGenerator mockColorGenerator;

  setUp(() {
    mockColorGenerator = MockColorGenerator();
  });

  group('ColorChangerView', () {
    group('renders', () {
      testWidgets('properly', (tester) async {
        await tester.pumpAppWithCubit<ColorChangerCubit>(
          home: const ColorChangerView(),
          cubit: ColorChangerCubit(mockColorGenerator),
        );
      });
    });
  });
}
