part of 'utils.dart';

/// A basic cache that stores [CustomColor]s.
class ColorCache {
  /// The default maximum number of [CustomColor]s
  @visibleForTesting
  static const defaultMaxCacheSize = 1000;

  /// The maximum number of [CustomColor]s
  /// that can be stored in the cache.
  @visibleForTesting
  final int maxCacheSize;

  /// The cache of [CustomColor]s.
  ///
  /// Here map is used for fast lookup.
  final Map<int, CustomColor> _cache = {};

  /// List of [CustomColor]s in the cache.
  List<CustomColor> get colors => _cache.values.toList();

  /// Creates a new [ColorCache] instance.
  /// The [maxCacheSize] is the maximum number of [CustomColor]s
  /// that can be stored in the cache. If no [maxCacheSize] is provided,
  /// the default value of [defaultMaxCacheSize] is used.
  ColorCache([int? maxCacheSize])
      : maxCacheSize = maxCacheSize ?? defaultMaxCacheSize;

  /// Adds a [CustomColor] to the cache.
  void add(CustomColor color) {
    if (_cache.length >= maxCacheSize) {
      _cache.remove(_cache.keys.first);
    }

    _cache[color.hashCode] = color;
  }

  /// Checks if the cache contains a [CustomColor]
  bool contains(CustomColor color) => _cache.containsKey(color.hashCode);
}
