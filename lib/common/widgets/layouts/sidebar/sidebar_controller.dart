import 'package:get/get.dart';
import 'package:store/routes/routes.dart';
import 'package:store/utils/device/device_utility.dart';

class SidebarController extends GetxController {
  final activeItem = ''.obs;
  final hoveredItem = ''.obs;

  @override
  void onInit() {
    super.onInit();
    activeItem.value =
        Get.currentRoute.isNotEmpty ? Get.currentRoute : SRoutes.dashboard;
  }

  void changeActiveItem(String route) => activeItem.value = route;

  void changeHoveredItem(String route) {
    if (!isActive(route)) hoveredItem.value = route;
  }

  bool isExActive(String route) => activeItem.value.contains(route);

  bool isActive(String route) => activeItem.value == route;

  bool isHovered(String route) => hoveredItem.value == route;

  bool isParentActive(String parentRoute, List<dynamic>? children) {
    if (isActive(parentRoute)) return true;
    return children?.any((child) => isActive(child.route ?? '')) ?? false;
  }

  void onMenuTaped(String route) {
    if (!isActive(route)) {
      changeActiveItem(route);

      if (!SDeviceUtils.isDesktopScreen(Get.context!)) Get.back();

      Get.toNamed(route);
    }
  }
}
