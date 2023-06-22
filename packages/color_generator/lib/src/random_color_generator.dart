part of 'color_generator.dart';

/// A random color generator
class RandomColorGenerator implements ColorGenerator {
  /// Used to generate random 8 bit values
  final RandomEightBitGenerator _randomEightBitGenerator;

  /// Creates a new [RandomColorGenerator] instance
  /// with the provided [RandomEightBitGenerator]
  const RandomColorGenerator(this._randomEightBitGenerator);

  @override
  CustomColor generateColor() {
    final red = _randomEightBitGenerator.generate();
    final green = _randomEightBitGenerator.generate();
    final blue = _randomEightBitGenerator.generate();

    final color = Color.fromARGB(255, red, green, blue);

    return CustomColor.fromColor(color);
  }
}
