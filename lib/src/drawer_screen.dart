import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  final Color backgroundColor;
  final List<Color> colors;
  final Widget? leading;
  final Widget? trailing;
  final Widget? items;

  const DrawerScreen({
    super.key,
    required this.backgroundColor,
    required this.colors,
    this.leading,
    this.trailing,
    this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        gradient: LinearGradient(
          begin: AlignmentDirectional.centerStart,
          end: AlignmentDirectional.centerEnd,
          colors: colors,
        ),
      ),
      padding: const EdgeInsetsDirectional.only(top: 60, bottom: 130, start: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              leading ?? const SizedBox(),
              const SizedBox(height: 30),
              items ?? const SizedBox(),
            ],
          ),
          trailing ?? const SizedBox(),
        ],
      ),
    );
  }
}
