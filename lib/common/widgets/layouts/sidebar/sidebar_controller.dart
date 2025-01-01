import 'package:get/get.dart';
import 'package:store/routes/routes.dart';
import 'package:store/utils/device/device_utility.dart';

class SidebarController extends GetxController {
  final activeItem = SRoutes.dashboard.obs;
  final hoveredItem = ''.obs;
  void changeActiveItem(String route) => activeItem.value = route;
  void changeHoveredItem(String route) {
    if (!isActive(route)) hoveredItem.value = route;
  }

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
