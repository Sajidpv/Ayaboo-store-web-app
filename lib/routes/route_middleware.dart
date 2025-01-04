import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TRouteMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    debugPrint('Middleware: Checking authorization for route: $route');

    // Example authorization check (uncomment and adapt as needed)
    // if (!AuthRepository.instance.user) {
    //   debugPrint('User not authorized. Redirecting to login.');
    //   return const RouteSettings(name: SRoutes.login);
    // }

    return null;
  }
}
