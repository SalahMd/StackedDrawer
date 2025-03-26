import 'package:flutter/widgets.dart';

class AnimatedPage extends StatelessWidget {
  final double xOffset, yOffset, zOffset, scale;
  final bool isDrawerOpen;
  final void Function(bool open) changeState;
  final Widget screen;
  final Curve curve;
  final Duration duration;

  const AnimatedPage({
    super.key,
    required this.xOffset,
    required this.yOffset,
    required this.zOffset,
    required this.scale,
    required this.isDrawerOpen,
    required this.changeState,
    required this.screen,
    required this.curve,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, zOffset)
        ..scale(scale),
      curve: curve,
      duration: duration,
      child: GestureDetector(
        onHorizontalDragUpdate: (details) {
          changeState(!isDrawerOpen);
        },
        child: screen,
      ),
    );
  }
}

