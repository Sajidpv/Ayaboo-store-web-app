import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/containers/container_widget.dart';
import 'package:store/features/media/controller/media_controller.dart';
import 'package:store/features/media/controller/show_selected_imgs_component.dart';
import 'package:store/features/media/model/media_model.dart';
import 'package:store/features/media/screens/widgets/folder_dropdown.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/enums.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/device/device_utility.dart';
// import 'package:universal_html/html.dart' as html;

class MediaUploader extends StatelessWidget {
  const MediaUploader({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MediaController.instance;
    return Obx(
      () => controller.showImgUploadSection.value
          ? Column(
              spacing: TSizes.spaceBtwSections,
              children: [
                SContainerWidget(
                  elevation: .5,
                  height: 250,
                  showBorder: true,
                  borderColor: TColors.borderPrimary,
                  backgroundColor: Colors.transparent,
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: Column(
                    children: [
                      Expanded(
                          child: Stack(
                        alignment: Alignment.center,
                        children: [
                          DropzoneView(
                              mime: const ['image/jpeg', 'image/png'],
                              cursor: CursorType.Default,
                              operation: DragOperation.copy,
                              onLoaded: () => debugPrint('media loaded'),
                              onError: (er) => debugPrint('media error'),
                              onHover: () => debugPrint('media hovered'),
                              onLeave: () => debugPrint('media leave'),
                              onCreated: (ctrl) =>
                                  controller.mediaController = ctrl,
                              onDropInvalid: (er) =>
                                  debugPrint('media invalid'),
                              onDropFiles: (file) =>
                                  debugPrint('multiple media droped:'),
                              onDropFile: (file) async {
                                // if (file is html.File) {
                                final bytes = await controller.mediaController
                                    .getFileData(file);
                                final image = ImageModel(
                                    url: '',
                                    folder: '',
                                    file: file,
                                    fileName: file.name,
                                    localImageToDisplay:
                                        Uint8List.fromList(bytes));
                                controller.selectedImagesToUpload.add(image);
                                // } else if (file is String) {
                                //   debugPrint('zone drop:$file');
                                // } else {
                                //   debugPrint(
                                //       'zone unknown type :${file.runtimeType}');
                                // }
                              }),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            spacing: TSizes.spaceBtwItems,
                            children: [
                              const Icon(Icons.folder_copy_outlined),
                              const Text('Drag and Drop images here.'),
                              OutlinedButton(
                                  onPressed: () =>
                                      controller.selectLocalImages(),
                                  child: const Text('Select Images'))
                            ],
                          )
                        ],
                      ))
                    ],
                  ),
                ),
                Obx(
                  () => controller.selectedImagesToUpload.isNotEmpty
                      ? SContainerWidget(
                          elevation: .2,
                          padding: const EdgeInsets.all(TSizes.defaultSpace),
                          child: Column(
                            spacing: TSizes.spaceBtwItems,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    spacing: TSizes.spaceBtwItems,
                                    children: [
                                      Text(
                                        'Select Folder',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall,
                                      ),
                                      MediaFolderDropdown(
                                        onChanged: (MediaCategory? newValue) {
                                          if (newValue != null) {
                                            controller.selectedPath.value =
                                                newValue;
                                          }
                                        },
                                      )
                                    ],
                                  ),
                                  Row(
                                    spacing:
                                        SDeviceUtils.isMobileScreen(context)
                                            ? 0
                                            : TSizes.spaceBtwItems,
                                    children: [
                                      TextButton(
                                          onPressed: controller
                                              .selectedImagesToUpload.clear,
                                          child: const Text('Remove All')),
                                      SDeviceUtils.isMobileScreen(context)
                                          ? const SizedBox.shrink()
                                          : _BuildUploadButton()
                                    ],
                                  ),
                                ],
                              ),
                              const BuildSelectedImgShowSection(),
                              SDeviceUtils.isMobileScreen(context)
                                  ? _BuildUploadButton()
                                  : const SizedBox.shrink()
                            ],
                          ),
                        )
                      : const SizedBox.shrink(),
                )
              ],
            )
          : const SizedBox.shrink(),
    );
  }
}

class _BuildUploadButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SDeviceUtils.isMobileScreen(context)
          ? double.infinity
          : TSizes.buttonWidth,
      child: ElevatedButton(
          onPressed: MediaController.instance.confirmUploadImages,
          child: const Text('Upload')),
    );
  }
}
