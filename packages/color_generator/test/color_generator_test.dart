import 'package:color_generator/color_generator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const input = 1;
  const output = 2;

  test('adds one to input values', () {
    final calculator = ColorGenerator();
    expect(calculator.addOne(input), output);
  });
}
