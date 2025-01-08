import 'package:flutter/material.dart';
import 'package:store/common/widgets/containers/container_widget.dart';
import 'package:store/features/media/controller/media_controller.dart';
import 'package:store/features/media/controller/show_selected_imgs_component.dart';
import 'package:store/features/media/screens/widgets/folder_dropdown.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/enums.dart';
import 'package:store/utils/constants/sizes.dart';

class MediaContentSection extends StatelessWidget {
  const MediaContentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MediaController.instance;
    return SContainerWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: TSizes.spaceBtwItems,
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
          const BuildSelectedImgShowSection(),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
            child: Row(
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
            ),
          )
        ],
      ),
    );
  }
}
