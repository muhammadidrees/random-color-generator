part of 'view.dart';

/// Root widget of the color changer feature
class ColorChangerScreen extends StatelessWidget {
  /// Creates the root widget of the color changer feature
  const ColorChangerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ColorChangerCubit>(
      create: (context) => ColorChangerCubit(
        RandomUniqueColorGenerator(),
      ),
      child: const ColorChangerView(),
    );
  }
}
