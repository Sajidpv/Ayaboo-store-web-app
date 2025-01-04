import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:store/app.dart';
import 'package:store/common/widgets/layouts/templates/site_layout.dart';
import 'package:store/features/auth/screens/login_screen.dart';
import 'package:store/features/shop/screens/dashbord/dashbord_screen.dart';
import 'package:store/features/shop/screens/sales/sales_screen.dart';
import 'package:store/routes/route_middleware.dart';
import 'package:store/routes/routes.dart';

class SAppRoutes {
  static final List<GetPage> pages = [
    GetPage(
      name: SRoutes.n404,
      page: () => const NotFoundPage(),
    ),
    GetPage(
      name: SRoutes.welcome,
      page: () => const App(),
    ),
    GetPage(
      name: SRoutes.login,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: SRoutes.dashboard,
      middlewares: [TRouteMiddleware()],
      page: () => const DashbordScreen(),
    ),
    GetPage(
      name: SRoutes.product,
      middlewares: [TRouteMiddleware()],
      page: () => const SSiteLayout(),
    ),
    GetPage(
      name: SRoutes.productReview,
      middlewares: [TRouteMiddleware()],
      page: () => const SSiteLayout(),
    ),
    GetPage(
      name: SRoutes.sales,
      middlewares: [TRouteMiddleware()],
      page: () => const SalesScreen(),
    ),
    GetPage(
      name: SRoutes.customerRefund,
      middlewares: [TRouteMiddleware()],
      page: () => const SSiteLayout(),
    ),
    GetPage(
      name: SRoutes.customers,
      middlewares: [TRouteMiddleware()],
      page: () => const SSiteLayout(),
    ),
    GetPage(
      name: SRoutes.stockRecived,
      middlewares: [TRouteMiddleware()],
      page: () => const SSiteLayout(),
    ),
    GetPage(
      name: SRoutes.stockReturns,
      middlewares: [TRouteMiddleware()],
      page: () => const SSiteLayout(),
    ),
    GetPage(
      name: SRoutes.stockTransfer,
      middlewares: [TRouteMiddleware()],
      page: () => const SSiteLayout(),
    ),
    GetPage(
      name: SRoutes.sellerConversation,
      middlewares: [TRouteMiddleware()],
      page: () => const SSiteLayout(),
    ),
    GetPage(
      name: SRoutes.sellerProducts,
      middlewares: [TRouteMiddleware()],
      page: () => const SSiteLayout(),
    ),
    GetPage(
      name: SRoutes.sellerReturns,
      middlewares: [TRouteMiddleware()],
      page: () => const SSiteLayout(),
    ),
    GetPage(
      name: SRoutes.sellerStocks,
      middlewares: [TRouteMiddleware()],
      page: () => const SSiteLayout(),
    ),
    GetPage(
      name: SRoutes.reportSale,
      middlewares: [TRouteMiddleware()],
      page: () => const SSiteLayout(),
    ),
    GetPage(
      name: SRoutes.reportSearchs,
      middlewares: [TRouteMiddleware()],
      page: () => const SSiteLayout(),
    ),
    GetPage(
      name: SRoutes.reportStock,
      middlewares: [TRouteMiddleware()],
      page: () => const SSiteLayout(),
    ),
    GetPage(
      name: SRoutes.reportWishlist,
      middlewares: [TRouteMiddleware()],
      page: () => const SSiteLayout(),
    ),
    GetPage(
      name: SRoutes.accountCommission,
      middlewares: [TRouteMiddleware()],
      page: () => const SSiteLayout(),
    ),
    GetPage(
      name: SRoutes.accountPayment,
      middlewares: [TRouteMiddleware()],
      page: () => const SSiteLayout(),
    ),
    GetPage(
      name: SRoutes.accountRent,
      middlewares: [TRouteMiddleware()],
      page: () => const SSiteLayout(),
    ),
    GetPage(
      name: SRoutes.accountWithdraw,
      middlewares: [TRouteMiddleware()],
      page: () => const SSiteLayout(),
    ),
    GetPage(
      name: SRoutes.settingsShipping,
      middlewares: [TRouteMiddleware()],
      page: () => const SSiteLayout(),
    ),
    GetPage(
      name: SRoutes.settingsStore,
      middlewares: [TRouteMiddleware()],
      page: () => const SSiteLayout(),
    ),
    GetPage(
      name: SRoutes.conversation,
      middlewares: [TRouteMiddleware()],
      page: () => const SSiteLayout(),
    ),
    GetPage(
      name: SRoutes.supportTicket,
      middlewares: [TRouteMiddleware()],
      page: () => const SSiteLayout(),
    ),
  ];
}
