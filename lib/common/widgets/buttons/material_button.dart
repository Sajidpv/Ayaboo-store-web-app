import 'package:flutter/material.dart';
import 'package:store/utils/constants/colors.dart';

class MaterialButtonWidget extends StatelessWidget {
  const MaterialButtonWidget({
    super.key,
    required this.title,
    this.onPressed,
  });
  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50,
      onPressed: onPressed,
      color: TColors.grey,
      child: Text(
        title,
        style: const TextStyle(
          color: TColors.blackAccent,
          fontSize: 16,
        ),
      ),
    );
  }
}
