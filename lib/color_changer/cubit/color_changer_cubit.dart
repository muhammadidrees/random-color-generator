import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'color_changer_state.dart';

/// Cubit that handles the state of the color
class ColorChangerCubit extends Cubit<ColorChangerState> {
  /// Constructor that sets the initial state
  ColorChangerCubit() : super(ColorChangerInitial());
}
