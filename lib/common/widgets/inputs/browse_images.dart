import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/features/media/controller/media_controller.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/sizes.dart';

class SBrowsImages extends StatelessWidget {
  const SBrowsImages({
    super.key,
    this.onPress,
    this.bLabel,
  });

  final void Function()? onPress;
  final String? bLabel;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put<MediaController>(MediaController());
    return InkWell(
      onTap: onPress ?? controller.selectedImageFromMedia,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: TColors.textSecondary.withValues(alpha: .3),
            ),
            borderRadius:
                BorderRadius.circular(TSizes.inputFieldMinimumRadius)),
        height: 50,
        child: Row(
          spacing: TSizes.spaceBtwItems,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: TColors.textSecondary.withValues(alpha: .2),
                  borderRadius: const BorderRadius.only(
                      topLeft:
                          Radius.circular(TSizes.inputFieldMinimumRadius - 1),
                      bottomLeft:
                          Radius.circular(TSizes.inputFieldMinimumRadius - 1))),
              width: 80,
              height: double.maxFinite,
              child: Center(
                  child: Text(
                bLabel ?? 'Browse',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: TColors.textSecondary),
              )),
            ),
            Expanded(
              child: Text(
                'Choose file',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: TColors.textSecondary.withValues(alpha: .8)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
