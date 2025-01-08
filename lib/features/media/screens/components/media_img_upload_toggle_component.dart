import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/features/media/controller/media_controller.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/sizes.dart';

class BuildUploadImgButtonToggle extends StatelessWidget {
  const BuildUploadImgButtonToggle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MediaController());
    return SizedBox(
      width: TSizes.buttonWidth * 1.5,
      child: ElevatedButton.icon(
          onPressed: () => controller.showImgUploadSection.value =
              !controller.showImgUploadSection.value,
          label: const Text('Upload Images'),
          icon: const Icon(
            Icons.cloud_upload_rounded,
            color: TColors.white,
          )),
    );
  }
}
