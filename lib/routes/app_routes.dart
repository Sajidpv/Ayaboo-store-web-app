import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:store/app.dart';
import 'package:store/common/widgets/layouts/templates/site_layout.dart';
import 'package:store/features/auth/screens/login_screen.dart';
import 'package:store/routes/route_middleware.dart';
import 'package:store/routes/routes.dart';

class SAppRoutes {
  static final List<GetPage> pages = [
    GetPage(
      name: SRoutes.splash,
      middlewares: [TRouteMiddleware()],
      page: () => const App(),
    ),
    GetPage(
      name: SRoutes.login,
      middlewares: [TRouteMiddleware()],
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: SRoutes.dashboard,
      middlewares: [TRouteMiddleware()],
      page: () => const SSiteLayout(),
    ),
    GetPage(
      name: SRoutes.product,
      middlewares: [TRouteMiddleware()],
      page: () => const SSiteLayout(),
    ),
    GetPage(
      name: SRoutes.n404,
      page: () => const App(),
    )
  ];
}
