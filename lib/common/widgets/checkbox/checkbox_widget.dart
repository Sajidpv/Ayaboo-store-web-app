import 'package:flutter/material.dart';

class SCheckboxWidget extends StatelessWidget {
  const SCheckboxWidget({
    super.key,
    required this.value,
    this.onChanged,
    required this.text,
  });
  final bool value;
  final void Function(bool?)? onChanged;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: true,
          onChanged: onChanged,
        ),
        Text(
          text,
        ),
      ],
    );
  }
}
