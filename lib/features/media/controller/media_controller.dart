import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
import 'package:store/features/media/model/media_model.dart';
import 'package:store/features/media/screens/widgets/media_content_section.dart';
import 'package:store/features/media/screens/widgets/media_uploader.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/enums.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/popups/dialogues.dart';
import 'package:store/utils/popups/full_screen_loader.dart';
import 'package:store/utils/popups/loaders.dart';
// import 'package:universal_html/html.dart' as html;

class MediaController extends GetxController {
  static MediaController get instance => Get.find();
  late DropzoneViewController mediaController;
  final RxBool showImgUploadSection = false.obs;
  final Rx<MediaCategory> selectedPath = MediaCategory.folders.obs;
  final RxList<ImageModel> selectedImagesToUpload = <ImageModel>[].obs;
  Future<void> uploadImages() async {
    try {
      Get.back();

      for (var i = selectedImagesToUpload.length - 1; i >= 0; i--) {
        // var selectedImage = selectedImagesToUpload[i];
        // final image = selectedImage.file;
      }
    } catch (e) {
      SFullScreenLoader.stopLoading();
      SLoaders.errorSnackBar(
          title: 'Error Uploading Images',
          message: 'Something went wrong while uploading your images');
    }
  }

  void confirmUploadImages() {
    if (selectedPath.value == MediaCategory.folders) {
      SLoaders.errorSnackBar(
          title: 'Select Folder',
          message: 'Please select a folder to upload the image(s).');
      return;
    }
    SDialogues.defaultConfirmationDialog(
      context: Get.context!,
      title: 'Upload Images',
      confirmText: 'Upload',
      content:
          'Are you sure you want to upload all the images in ${selectedPath.value.name.toUpperCase()} folder?',
      onConfirm: uploadImages,
    );
  }

  Future<void> selectLocalImages() async {
    final files = await mediaController
        .pickFiles(multiple: true, mime: const ['image/jpeg', 'image/png']);

    if (files.isNotEmpty) {
      for (var file in files) {
        // if (file is html.File) {
        final bytes = await mediaController.getFileData(file);
        final image = ImageModel(
            url: '',
            folder: '',
            file: file,
            fileName: file.name,
            localImageToDisplay: Uint8List.fromList(bytes));
        selectedImagesToUpload.add(image);
        if (kDebugMode) {
          print(selectedImagesToUpload.length);
        }

        // }
      }
    }
  }

  Future<List<ImageModel>?> selectedImageFromMedia(
      {List<String>? selectedUrls,
      bool allowSelection = true,
      bool allowMultipleSelection = false}) async {
    showImgUploadSection.value = true;
    List<ImageModel>? selectedImages = await Get.bottomSheet<List<ImageModel>>(
        isScrollControlled: true,
        backgroundColor: TColors.primaryBackground,
        FractionallySizedBox(
          heightFactor: 1,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const MediaUploader(),
                  MediaContentSection(
                    allowMultipleSelection: allowMultipleSelection,
                    allowSelection: allowSelection,
                    alreadySelectedUrls: selectedUrls ?? [],
                  )
                ],
              ),
            ),
          ),
        ));
    return selectedImages;
  }
}
