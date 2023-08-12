import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  const Circle({
    super.key,
    required this.radius,
    required this.color,
    this.child,
  });

  final double radius;
  final Color color;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: radius,
      width: radius,
      child: ClipOval(
        child: ColoredBox(
          color: color,
          child: child,
        ),
      ),
    );
  }
}
