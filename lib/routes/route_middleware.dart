import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/routes/routes.dart';

class TRouteMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    debugPrint('---------------------Route middleware---------------------');
    bool isAuthenticated = true;
    // ignore: dead_code
    return isAuthenticated ? null : const RouteSettings(name: SRoutes.login);
  }
}
