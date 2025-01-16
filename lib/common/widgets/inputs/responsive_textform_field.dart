import 'package:flutter/material.dart';

class ResponsiveTextFormField extends StatelessWidget {
  const ResponsiveTextFormField({
    super.key,
    this.hintText,
    this.maxLines = 1,
  });

  final String? hintText;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double maxWidth = constraints.maxWidth * 0.9;

        return ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: maxWidth,
          ),
          child: TextFormField(
            maxLines: maxLines,
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        );
      },
    );
  }
}
