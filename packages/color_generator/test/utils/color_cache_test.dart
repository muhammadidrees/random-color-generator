import 'dart:ui';

import 'package:color_generator/color_generator.dart';
import 'package:color_generator/src/utils/utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const maxCacheSize = 2;

  final mockCustomColor1 = CustomColor.fromColor(const Color(0xFF000001));
  final mockCustomColor2 = CustomColor.fromColor(const Color(0xFF000002));
  final mockCustomColor3 = CustomColor.fromColor(const Color(0xFF000003));

  group('ColorCache', () {
    ColorCache createColorCache() => ColorCache(maxCacheSize);

    group("initializes", () {
      test('with empty cache', () {
        final cache = ColorCache(maxCacheSize);
        expect(cache.colors, isEmpty);
      });

      test('with maxCacheSize', () {
        final cache = ColorCache(maxCacheSize);
        expect(cache.maxCacheSize, maxCacheSize);
      });

      test('with defaultMaxCacheSize when maxCacheSize is not provided', () {
        final cache = ColorCache();
        expect(cache.maxCacheSize, ColorCache.defaultMaxCacheSize);
      });
    });

    group('add(CustomColor color)', () {
      test('adds color to cache', () {
        final cache = createColorCache();
        cache.add(mockCustomColor1);
        expect(cache.colors, [mockCustomColor1]);
      });

      test('removes oldest color when cache is full', () {
        final cache = createColorCache();
        cache.add(mockCustomColor1);
        cache.add(mockCustomColor2);
        cache.add(mockCustomColor3);
        expect(cache.colors, isNot(contains(mockCustomColor1)));
      });

      test('does not add color if already in cache', () {
        final cache = createColorCache();
        cache.add(mockCustomColor1);
        cache.add(mockCustomColor1);
        expect(cache.colors, [mockCustomColor1]);
      });
    });

    group('contains(CustomColor color)', () {
      test('returns true if color is in cache', () {
        final cache = createColorCache();
        cache.add(mockCustomColor1);
        expect(cache.contains(mockCustomColor1), isTrue);
      });

      test('returns false if color is not in cache', () {
        final cache = createColorCache();
        cache.add(mockCustomColor1);
        expect(cache.contains(mockCustomColor2), isFalse);
      });
    });
  });
}
