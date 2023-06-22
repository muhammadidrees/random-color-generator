part of 'utils.dart';

/// A decorator for [Random] that generates random 8-bit integers.
///
/// This is a convenience class that allows us to generate color values.
class RandomEightBitGenerator {
  /// The [Random] instance to use.
  final Random _random;

  /// The maximum value of an 8-bit integer.
  @visibleForTesting
  static const eightBitMaxValue = 255;

  /// Creates a new [RandomEightBitGenerator] instance.
  const RandomEightBitGenerator(this._random);

  /// Generates a random 8-bit integer.
  int generate() => _random.nextInt(eightBitMaxValue);
}
