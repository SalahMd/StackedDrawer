export 'src/animated_page.dart';
export 'src/drawer_screen.dart';

import 'package:flutter/material.dart';
import 'package:stacked_drawer/stacked_drawer.dart';


class AnimatedDrawer extends StatefulWidget {
  //Change xOffset
  final double xOffset;

  //Change yOffset
  final double? yOffset;

  //Change zOffset
  final double? zOffset;

  //Change scale
  final double scale;

  ///Add your home screen
  final Widget screen;

  /// Add list of colors for more customization
  final List<Color> colors;

  /// Change backgroundColor of the AppBar
  final Color backgroundColor;

  ///Change leading of the AppBar
  final Widget? leading;

  ///Add items for the app bar
  final Widget? items;

  //Add trailing for the app bar
  final Widget? trailing;

  //Change the curve of the app bar
  final Curve curve;

  ///Change the ability of draggabling the app bar
  final bool isDraggable;

  ///get the State of the app bar
  final void Function(bool open) onHorizontalDrag;

  //Set a duration for the app bar
  final Duration duration;

  const AnimatedDrawer({
    super.key,
    required this.xOffset,
    this.yOffset,
    required this.scale,
    required this.onHorizontalDrag,
    required this.screen,
    required this.colors,
    this.backgroundColor = Colors.blue,
    this.leading,
    this.items,
    this.trailing,
    this.zOffset,
    this.curve = Curves.fastEaseInToSlowEaseOut,
    this.isDraggable = true,
    this.duration = const Duration(milliseconds: 500),
  });

  @override
  State<AnimatedDrawer> createState() => _AnimatedDrawerState();
}

class _AnimatedDrawerState extends State<AnimatedDrawer> {
  late bool isDrawerOpen;
  late double xOffset;
  late double yOffset;
  late double zOffset;
  late double scale;

  @override
  void initState() {
    super.initState();
    isDrawerOpen = false;
    xOffset = 0;
    yOffset = widget.yOffset ?? 0;
    zOffset = widget.zOffset ?? 0;
    scale = 1.0;
  }

  void changeDrawerState() {
    setState(() {
      isDrawerOpen = !isDrawerOpen;
      xOffset = isDrawerOpen ? widget.xOffset : 0;
      yOffset = isDrawerOpen ? (widget.yOffset ?? 0) : 0;
      zOffset = isDrawerOpen ? (widget.zOffset ?? 0) : 0;
      scale = isDrawerOpen ? widget.scale : 1.0;
    });

    widget.onHorizontalDrag(isDrawerOpen); 
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DrawerScreen(
          backgroundColor: widget.backgroundColor,
          colors: widget.colors,
          trailing: widget.trailing,
          items: widget.items,
          leading: widget.leading,
        ),
        AnimatedPage(
          xOffset: xOffset,
          yOffset: yOffset,
          zOffset: zOffset,
          scale: scale,
          isDrawerOpen: isDrawerOpen,
          changeState: (open) {
            if (widget.isDraggable) {
              changeDrawerState();
            }
          },
          screen: widget.screen,
          curve: widget.curve,
          duration: widget.duration,
        )
      ],
    );
  }
}

