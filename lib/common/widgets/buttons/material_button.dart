import 'package:flutter/material.dart';
import 'package:store/utils/constants/colors.dart';

class MaterialButtonWidget extends StatelessWidget {
  const MaterialButtonWidget({
    super.key,
    required this.title,
    this.onPressed,
    this.color = TColors.grey,
    this.textColor = TColors.blackAccent,
  });
  final String title;
  final Color color, textColor;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50,
      onPressed: onPressed,
      color: color,
      child: Text(
        title,
        style: TextStyle(
          color: textColor,
          fontSize: 16,
        ),
      ),
    );
  }
}
