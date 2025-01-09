import 'package:get/get.dart';
import 'package:store/features/media/controller/media_controller.dart';
import 'package:store/features/media/model/media_model.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();
  Rx<String?> selectedThumbnileImage = Rx<String?>(null);
  final RxList<String> additionalProductImagesUrls = <String>[].obs;

  void selectThumbnileImage() async {
    final controller = Get.put(MediaController());
    List<ImageModel>? selectedImages =
        await controller.selectedImageFromMedia();
    if (selectedImages != null && selectedImages.isNotEmpty) {
      ImageModel image = selectedImages.first;
      selectedThumbnileImage.value = image.url;
    }
  }

  void selectProductImages() async {
    final controller = Get.put(MediaController());
    final selectedImages = await controller.selectedImageFromMedia(
        allowMultipleSelection: true,
        selectedUrls: additionalProductImagesUrls);
    if (selectedImages != null && selectedImages.isNotEmpty) {
      additionalProductImagesUrls.assignAll(selectedImages.map((e) => e.url));
    }
  }

  Future<void> removeImage(int index) async {
    additionalProductImagesUrls.removeAt(index);
  }
}
