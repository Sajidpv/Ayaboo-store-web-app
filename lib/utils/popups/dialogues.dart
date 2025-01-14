import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/sizes.dart';

class SDialogues {
  static defaultConfirmationDialog(
      {required BuildContext context,
      String title = 'Removal Confirmation',
      String content =
          'Removing this data will delete all the related data! are you sure?',
      String cancelText = 'Cancel',
      String confirmText = 'Remove',
      Function()? onCancell,
      Function()? onConfirm}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              TextButton(
                  onPressed: onCancell ?? () => Get.back(),
                  child: Text(cancelText)),
              TextButton(onPressed: onConfirm, child: Text(confirmText))
            ],
          );
        });
  }

  static defaultDialog({
    required BuildContext context,
    Widget title = const SizedBox(),
    Widget content = const SizedBox(),
    final Color color = TColors.white,
    List<Widget>? actions,
  }) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: color,
            shape: BeveledRectangleBorder(
                borderRadius:
                    BorderRadius.circular(TSizes.buttonMinimumRadius)),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                title,
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Get.back(),
                )
              ],
            ),
            content: content,
            actions: actions,
            actionsOverflowDirection: VerticalDirection.down,
          );
        });
  }
}
