import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/utils/constants/colors.dart';

class SortDropDown<T extends Enum> extends StatelessWidget {
  const SortDropDown({
    super.key,
    required this.values,
    this.hint = 'Sort by',
    this.onChanged,
    this.selectedValue,
  });

  final String hint;
  final T? selectedValue;
  final void Function(T?)? onChanged;
  final List<T> values;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 400,
      ),
      child: DropdownButtonFormField<T>(
        decoration: InputDecoration(
          hintText: hint,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: TColors.borderPrimary.withValues(alpha: 0.5),
              width: 1.0,
            ),
          ),
        ),
        isExpanded: true,
        value: selectedValue,
        items: values
            .map(
              (value) => DropdownMenuItem<T>(
                value: value,
                child: Text(
                  value.name.capitalizeFirst.toString(),
                ),
              ),
            )
            .toList(),
        onChanged: onChanged,
      ),
    );
  }
}
