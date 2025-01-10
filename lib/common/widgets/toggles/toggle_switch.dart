import 'package:flutter/material.dart';
import 'package:store/utils/constants/colors.dart';

class ToggleSwitchWidget extends StatelessWidget {
  const ToggleSwitchWidget({
    super.key,
    this.onChanged,
    required this.value,
    this.color,
  });

  final void Function(bool)? onChanged;
  final bool value;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: value,
      activeColor: color ?? TColors.success,
      trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
      thumbColor: WidgetStateProperty.all(TColors.white),
      onChanged: onChanged,
    );
  }
}
