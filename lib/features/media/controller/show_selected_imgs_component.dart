import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/images/s_rounded_image.dart';
import 'package:store/features/media/controller/media_controller.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/enums.dart';
import 'package:store/utils/constants/sizes.dart';

class BuildSelectedImgShowSection extends StatelessWidget {
  const BuildSelectedImgShowSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MediaController.instance;
    return Obx(
      () => Wrap(
          alignment: WrapAlignment.start,
          spacing: TSizes.spaceBtwItems / 2,
          runSpacing: TSizes.spaceBtwItems / 2,
          children: controller.selectedImagesToUpload
              .where((image) => image.localImageToDisplay != null)
              .map(
                (element) => SRoundedImage(
                  width: 90,
                  height: 90,
                  padding: TSizes.sm,
                  imageType: ImageType.asset,
                  memoryImage: element.localImageToDisplay,
                  backgroundColor: TColors.primaryBackground,
                ),
              )
              .toList()),
    );
  }
}
