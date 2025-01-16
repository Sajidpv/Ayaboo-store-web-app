import 'package:flutter/material.dart';
import 'package:store/utils/constants/colors.dart';

class MaterialButtonWidget extends StatelessWidget {
  const MaterialButtonWidget({
    super.key,
    required this.title,
    this.onPressed,
    this.color = TColors.grey,
    this.textColor = TColors.blackAccent,
    this.padding,
    this.shape,
    this.icon,
    this.elevation,
  });
  final String title;
  final Color color, textColor;
  final EdgeInsetsGeometry? padding;
  final ShapeBorder? shape;
  final IconData? icon;
  final double? elevation;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: elevation,
      padding: padding,
      shape: shape,
      height: 50,
      onPressed: onPressed,
      color: color,
      child: Row(
        children: [
          if (icon != null)
            Icon(
              icon,
              color: textColor,
            ),
          Text(
            title,
            style: TextStyle(
              color: textColor,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
