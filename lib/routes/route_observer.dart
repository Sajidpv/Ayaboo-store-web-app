import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/layouts/sidebar/sidebar_controller.dart';
import 'package:store/routes/routes.dart';

class RouteObserver extends GetObserver {
  @override
  void didPop(Route route, Route? previousRoute) {
    final sideBarController = Get.put(SidebarController());

    if (previousRoute != null) {
      for (var routename in SRoutes.sideBarMenuItems) {
        if (previousRoute.settings.name == routename) {
          sideBarController.activeItem.value = routename;
        }
      }
    }
  }

  @override
  void didPush(Route? route, Route? previousRoute) {
    final sideBarController = Get.put(SidebarController());

    if (previousRoute != null) {
      for (var routename in SRoutes.sideBarMenuItems) {
        if (previousRoute.settings.name == routename) {
          sideBarController.activeItem.value = routename;
        }
      }
    }
  }
}
