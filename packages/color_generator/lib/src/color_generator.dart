import 'package:color_generator/color_generator.dart';
import 'package:color_generator/src/utils/utils.dart';
import 'package:flutter/material.dart';

part 'random_color_generator.dart';
part 'random_unique_color_generator.dart';

/// A Color Generator
abstract class ColorGenerator {
  /// generate a [CustomColor]
  CustomColor generateColor();
}
