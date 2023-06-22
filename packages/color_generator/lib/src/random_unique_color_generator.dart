part of 'color_generator.dart';

/// A Proxy for [RandomColorGenerator] that caches the generated colors
/// to avoid generating the same color twice.
class RandomUniqueColorGenerator extends ColorGenerator {
  /// Used to generate random 8 bit values
  final RandomColorGenerator _randomColorGenerator;

  /// Used to cache the generated colors
  final ColorCache _colorCache;

  /// max number of tries to generate a unique color
  /// before returning the same color
  ///
  /// This is to avoid infinite loops
  @visibleForTesting
  final int maxTries;

  /// default number of max tries
  @visibleForTesting
  static const defaultMaxTries = 1000;

  /// Creates a [RandomUniqueColorGenerator] with a [RandomColorGenerator]
  /// and a [ColorCache].
  RandomUniqueColorGenerator({
    RandomColorGenerator? randomColorGenerator,
    ColorCache? colorCache,
    @visibleForTesting this.maxTries = defaultMaxTries,
  })  : _randomColorGenerator = randomColorGenerator ?? RandomColorGenerator(),
        _colorCache = colorCache ?? ColorCache();

  @override
  CustomColor generateColor() {
    CustomColor color;
    int tries = 0;

    do {
      if (tries >= maxTries) {
        throw const MaxTriesExceededException();
      }
      color = _randomColorGenerator.generateColor();
      tries++;
    } while (_colorCache.contains(color));

    _colorCache.add(color);

    return color;
  }
}

/// Exception thrown when [RandomUniqueColorGenerator] fails to generate
/// a unique color after [RandomUniqueColorGenerator.maxTries] tries.
class MaxTriesExceededException implements Exception {
  /// Creates a [MaxTriesExceededException]
  const MaxTriesExceededException();
}
