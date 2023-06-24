import 'package:color_generator/color_generator.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'color_changer_state.dart';

/// Cubit that handles the state of the color
class ColorChangerCubit extends Cubit<ColorChangerState> {
  final ColorGenerator _colorGenerator;

  /// Constructor that sets the initial state
  ColorChangerCubit(this._colorGenerator) : super(const ColorChangerInitial());

  /// Changes the color of the state
  ///
  /// Throws an exception if the color cannot be generated
  void changeColor() {
    try {
      final color = _colorGenerator.generateColor();
      emit(ColorChangerChanged(color));
    } on Exception catch (e) {
      emit(ColorChangerFailed(e.toString()));
    }
  }
}
