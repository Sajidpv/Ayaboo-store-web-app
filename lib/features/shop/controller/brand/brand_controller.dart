import 'package:get/get.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();

  RxBool toggleFeaturedBrand = false.obs;
  RxBool togglePublishedBrand = false.obs;

  void togglePublishButton(value) {
    togglePublishedBrand.value = value;
  }

  void toggleFeaturedButton(value) {
    toggleFeaturedBrand.value = value;
  }
}
