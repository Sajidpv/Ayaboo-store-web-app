import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/containers/container_widget.dart';
import 'package:store/common/widgets/images/s_rounded_image.dart';
import 'package:store/features/media/controller/media_controller.dart';
import 'package:store/features/media/model/media_model.dart';
import 'package:store/features/media/screens/widgets/folder_dropdown.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/enums.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/device/device_utility.dart';

class MediaContentSection extends StatelessWidget {
  MediaContentSection(
      {super.key,
      this.allowSelection = false,
      this.allowMultipleSelection = false,
      this.alreadySelectedUrls,
      this.onImageSelected});
  final bool allowSelection, allowMultipleSelection;
  final List<String>? alreadySelectedUrls;
  final List<ImageModel> selectedImages = [];
  final Function(List<ImageModel> selectedImages)? onImageSelected;
  @override
  Widget build(BuildContext context) {
    bool loadedPreviousSelections = false;
    final controller = MediaController.instance;
    return SContainerWidget(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: TSizes.spaceBtwItems,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: TSizes.spaceBtwItems,
                children: [
                  Text(
                    'Gallery Folder',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  MediaFolderDropdown(
                    onChanged: (MediaCategory? newValue) {
                      if (newValue != null) {
                        controller.selectedPath.value = newValue;
                      }
                    },
                  )
                ],
              ),
              if (allowSelection && !SDeviceUtils.isMobileScreen(context))
                buildAddImageSelection()
            ],
          ),
          Obx(() {
            if (!loadedPreviousSelections) {
              if (alreadySelectedUrls != null &&
                  alreadySelectedUrls!.isNotEmpty) {
                final selectedUrlSet = Set<String>.from(alreadySelectedUrls!);
                for (var image in controller.selectedImagesToUpload) {
                  image.isSelected.value == selectedUrlSet.contains(image.url);
                  if (image.isSelected.value) {
                    selectedImages.add(image);
                  }
                }
              } else {
                for (var image in controller.selectedImagesToUpload) {
                  image.isSelected.value = false;
                }
              }
              loadedPreviousSelections = true;
            }
            return controller.selectedImagesToUpload.isEmpty
                ? const Center(child: Text('No images found'))
                : Wrap(
                    alignment: WrapAlignment.start,
                    spacing: TSizes.spaceBtwItems / 2,
                    runSpacing: TSizes.spaceBtwItems / 2,
                    children: controller.selectedImagesToUpload
                        .where((image) => image.localImageToDisplay != null)
                        .map(
                          (image) => allowSelection
                              ? _buildListWithCheckBox(image)
                              : _buildSimpleImageList(image),
                        )
                        .toList());
          }),
          Obx(() => controller.selectedImagesToUpload.isNotEmpty
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: TSizes.buttonWidth,
                      child: ElevatedButton.icon(
                          icon: const Icon(
                            Icons.arrow_downward,
                            color: TColors.white,
                          ),
                          onPressed: () {},
                          label: const Text('Load More')),
                    )
                  ],
                )
              : const SizedBox.shrink()),
          if (allowSelection && SDeviceUtils.isMobileScreen(context))
            Padding(
              padding: const EdgeInsets.only(bottom: TSizes.spaceBtwSections),
              child: buildAddImageSelection(),
            ),
        ],
      ),
    );
  }

  Widget _buildSimpleImageList(ImageModel element) {
    return SRoundedImage(
      width: 90,
      height: 90,
      padding: TSizes.sm,
      imageType: ImageType.asset,
      memoryImage: element.localImageToDisplay,
      margin: TSizes.spaceBtwItems / 2,
      backgroundColor: TColors.primaryBackground,
    );
  }

  Widget _buildListWithCheckBox(ImageModel image) {
    return Stack(
      children: [
        SRoundedImage(
          width: 90,
          height: 90,
          padding: TSizes.sm,
          imageType: ImageType.asset,
          memoryImage: image.localImageToDisplay,
          margin: TSizes.spaceBtwItems / 2,
          backgroundColor: TColors.primaryBackground,
        ),
        Positioned(
            top: TSizes.md,
            right: TSizes.md,
            child: Obx(() => Checkbox(
                value: image.isSelected.value,
                onChanged: (selected) {
                  if (selected != null) {
                    image.isSelected.value = selected;
                    if (selected) {
                      if (!allowMultipleSelection) {
                        for (var otherImages in selectedImages) {
                          if (otherImages != image) {
                            otherImages.isSelected.value = false;
                          }
                        }
                        selectedImages.clear();
                      }
                      selectedImages.add(image);
                    } else {
                      selectedImages.remove(image);
                    }
                  }
                })))
      ],
    );
  }

  Widget buildAddImageSelection() {
    return Row(
      spacing: TSizes.spaceBtwItems,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 120,
          child: OutlinedButton.icon(
              icon: const Icon(Icons.close_rounded),
              onPressed: () => Get.back(),
              label: const Text('Close')),
        ),
        SizedBox(
          width: 120,
          child: ElevatedButton.icon(
            onPressed: () => Get.back(result: selectedImages),
            label: const Text('Add'),
            icon: const Icon(
              Icons.image,
              color: TColors.white,
            ),
          ),
        )
      ],
    );
  }
}
