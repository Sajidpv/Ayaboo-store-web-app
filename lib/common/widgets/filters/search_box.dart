import 'package:flutter/material.dart';
import 'package:store/utils/constants/colors.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
    this.data,
    this.hint = 'Search anything..',
    this.controller,
    this.onChanged,
  });
  final String hint;
  final TextEditingController? controller;
  final List<dynamic>? data;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 400,
        ),
        child: TextFormField(
          controller: controller,
          onChanged: onChanged,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            hintText: hint,
            border: InputBorder.none, // Removes the default border
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: TColors.borderSecondary, width: 0), // No border color
            ),
          ),
        ));
  }
}
