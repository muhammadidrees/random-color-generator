import 'package:flutter/material.dart';
import 'package:random_color_generator/color_changer/color_changer.dart';

/// root widget for the app
class App extends StatelessWidget {
  /// default constructor
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Color Generator',
      home: ColorChangerScreen(),
    );
  }
}
