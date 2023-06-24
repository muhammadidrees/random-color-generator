part of 'view.dart';

/// View of the customColor changer feature
class ColorChangerView extends StatelessWidget {
  /// Constructor to create the view
  const ColorChangerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ColorChangerCubit, ColorChangerState>(
      listenWhen: (previous, current) => current is ColorChangerFailed,
      buildWhen: (previous, current) => current is! ColorChangerFailed,
      listener: (context, state) {
        if (state is ColorChangerFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        final color = state is ColorChangerChanged ? state.color : null;

        return Scaffold(
          body: TappableColoredWidget(
            customColor: color,
            onTap: () {
              context.read<ColorChangerCubit>().changeColor();
            },
          ),
        );
      },
    );
  }
}
