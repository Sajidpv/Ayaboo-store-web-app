import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/layouts/sidebar/sidebar_controller.dart';
import 'package:store/routes/routes.dart';

class RouteObserver extends GetObserver {
  @override
  void didPush(Route? route, Route? previousRoute) {
    final sideBarController = Get.find<SidebarController>();
    if (route?.settings.name != null) {
      if (SRoutes.sideBarMenuItems.contains(route!.settings.name)) {
        sideBarController.activeItem.value = route.settings.name!;
      }
    }
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    final sideBarController = Get.find<SidebarController>();

    if (previousRoute?.settings.name != null) {
      if (SRoutes.sideBarMenuItems.contains(previousRoute!.settings.name)) {
        sideBarController.activeItem.value = previousRoute.settings.name!;
      }
    }
  }

  // void _checkValidUrl(route) {
  //   if (!SRoutes.allRoutes.contains(route!.settings.name)) {
  //     debugPrint('checking..');
  //     Get.offNamed(SRoutes.n404);
  //     return;
  //   } else {
  //     return;
  //   }
  // }
}
