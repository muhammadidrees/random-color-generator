part of 'color_changer_cubit.dart';

/// State of the color
@immutable
abstract class ColorChangerState {
  /// State of the color
  const ColorChangerState();
}

/// Initial state of the color
class ColorChangerInitial extends ColorChangerState {
  /// Initial state of the color
  const ColorChangerInitial();
}

/// State of the color when it is changed
class ColorChangerChanged extends ColorChangerState with EquatableMixin {
  /// Color that is changed
  final CustomColor color;

  @override
  List<Object?> get props => [color];

  /// State of the color when it is changed
  const ColorChangerChanged(this.color);
}

/// Failed state of the color
class ColorChangerFailed extends ColorChangerState {
  /// Error message
  final String message;

  /// Failed state of the color
  const ColorChangerFailed(this.message);
}
