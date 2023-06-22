part of 'model.dart';

/// Represents a color along with it's contrast.
class CustomColor extends Equatable {
  /// The color value.
  final Color color;

  /// The contrast value.
  final Color contrast;

  static const _luminanceThreshold = 0.5;

  @override
  List<Object?> get props => [color, contrast];

  /// Creates a new [CustomColor] instance.
  /// with the given [color] and [contrast].
  const CustomColor._({
    required this.color,
    required this.contrast,
  });

  /// Creates a new [CustomColor] instance
  /// with the given [color] and generates the contrast
  /// based on the luminance of the given [color].
  factory CustomColor.fromColor(Color color) {
    final contrast = color.computeLuminance() > _luminanceThreshold
        ? Colors.black
        : Colors.white;

    return CustomColor._(
      color: color,
      contrast: contrast,
    );
  }
}
