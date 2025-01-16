import 'package:flutter/material.dart';
import 'package:store/utils/constants/colors.dart';

class STableActionButtons extends StatelessWidget {
  const STableActionButtons(
      {super.key,
      this.edit = false,
      this.more = true,
      this.delete = false,
      this.view = false,
      this.onDeletePressed,
      this.onMorePressed,
      this.onViewPressed,
      this.onEditPressed});
  final bool edit, delete, view, more;
  final VoidCallback? onDeletePressed,
      onViewPressed,
      onEditPressed,
      onMorePressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (view)
          IconButton(
              onPressed: onViewPressed,
              icon: const Icon(
                Icons.remove_red_eye_rounded,
                color: TColors.darkGrey,
              )),
        if (edit)
          IconButton(
              onPressed: onEditPressed,
              icon: const Icon(
                Icons.edit_document,
                color: TColors.darkGrey,
              )),
        if (delete)
          IconButton(
              onPressed: onDeletePressed,
              icon: const Icon(
                Icons.delete,
                color: TColors.darkGrey,
              )),
        if (more)
          IconButton(
              onPressed: onMorePressed,
              icon: const Icon(
                Icons.more_horiz_rounded,
                color: TColors.darkGrey,
              ))
      ],
    );
  }
}
