part of 'widget.dart';

/// A colored widget that can be tapped
class TappableColoredWidget extends StatelessWidget {
  /// Constructor to create the widget with a custom color
  /// and a callback to be called when the widget is tapped
  ///
  /// The [customColor] is an optional parameter and if not provided
  /// the [defaultColor] will be used
  TappableColoredWidget({
    Key? key,
    CustomColor? customColor,
    required this.onTap,
  })  : customColor = customColor ?? TappableColoredWidget.defaultColor,
        super(key: key);

  /// Default color value to be used if no custom color is provided
  @visibleForTesting
  static final CustomColor defaultColor = CustomColor.fromColor(Colors.white);

  /// The custom color of the widget
  final CustomColor customColor;

  /// The callback to be called when the widget is tapped
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        key: const Key('colored-content'),
        duration: const Duration(milliseconds: 500),
        color: customColor.color,
        child: Center(
          child: Text(
            "Hello there",
            style: TextStyle(color: customColor.contrast),
          ),
        ),
      ),
    );
  }
}
