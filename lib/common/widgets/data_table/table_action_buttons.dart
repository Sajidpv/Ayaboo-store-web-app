import 'package:flutter/material.dart';

class STableActionButtons extends StatelessWidget {
  const STableActionButtons(
      {super.key,
      this.edit = true,
      this.delete = true,
      this.view = false,
      this.onDeletePressed,
      this.onViewPressed,
      this.onEditPressed});
  final bool edit, delete, view;
  final VoidCallback? onDeletePressed, onViewPressed, onEditPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (view)
          IconButton(
              onPressed: onViewPressed,
              icon: const Icon(Icons.remove_red_eye_rounded)),
        if (edit)
          IconButton(
              onPressed: onEditPressed, icon: const Icon(Icons.edit_document)),
        if (delete)
          IconButton(
              onPressed: onDeletePressed,
              icon: const Icon(Icons.delete_forever_rounded))
      ],
    );
  }
}
