import 'package:flutter/material.dart';

class SContainerWidget extends StatelessWidget {
  final Widget? child;
  final bool isCentered;
  final bool isBorder;
  final double? leftPadding;
  final Color borderColor;
  final double padding;
  final double margin;
  final double? width;
  final double? height;
  final BorderRadiusGeometry? borderRadius;
  final Color backgroundColor;
  final Gradient? gradient;
  final double elevation;
  final double radius;

  const SContainerWidget({
    super.key,
    this.child,
    this.isCentered = false,
    this.isBorder = false,
    this.leftPadding,
    this.borderColor = Colors.grey,
    this.padding = 0.0,
    this.margin = 0.0,
    this.width,
    this.height,
    this.borderRadius,
    this.backgroundColor = Colors.transparent,
    this.gradient,
    this.elevation = 5.0,
    this.radius = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      borderRadius: BorderRadius.circular(radius),
      child: Container(
        margin: EdgeInsets.all(margin),
        width: width,
        height: height,
        decoration: BoxDecoration(
          border: isBorder ? Border.all(color: borderColor) : null,
          borderRadius:
              borderRadius ?? BorderRadius.all(Radius.circular(radius)),
          color: gradient != null ? null : backgroundColor,
          gradient: gradient,
        ),
        child: Padding(
          padding: leftPadding != null
              ? EdgeInsets.only(left: leftPadding!)
              : EdgeInsets.all(padding),
          child: isCentered
              ? Center(
                  child: child,
                )
              : child,
        ),
      ),
    );
  }
}
