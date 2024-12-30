import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:store/data/repositories/auth_repository.dart';
// import 'package:store/routes/routes.dart';

class TRouteMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    debugPrint('---------------------Route middleware---------------------');
    return null;
    // return AuthRepository.instance.user
    //     ? null
    //     : const RouteSettings(name: SRoutes.login);
  }
}
