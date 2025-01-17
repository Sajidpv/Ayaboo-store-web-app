import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:store/app.dart';
import 'package:store/common/widgets/layouts/templates/site_layout.dart';
import 'package:store/features/auth/screens/login_screen.dart';
import 'package:store/features/media/screens/media_screen.dart';
import 'package:store/features/shop/screens/accounts/commission_history/commission_history_screen.dart';
import 'package:store/features/shop/screens/accounts/payment_history/payment_history_screen.dart';
import 'package:store/features/shop/screens/accounts/rent_history/rent_history_screen.dart';
import 'package:store/features/shop/screens/accounts/withdrawal_history/money_withdrawal_history_screen.dart';
import 'package:store/features/shop/screens/brands/brand_screen.dart';
import 'package:store/features/shop/screens/conversations/conversation_screen.dart';
import 'package:store/features/shop/screens/customer.refunds/customer_refund_screen.dart';
import 'package:store/features/shop/screens/customers/customers_screen.dart';
import 'package:store/features/shop/screens/dashbord/dashbord_screen.dart';
import 'package:store/features/shop/screens/products/product%20reviews/product_review_screen.dart';
import 'package:store/features/shop/screens/products/products/products_screen.dart';
import 'package:store/features/shop/screens/reports/sales/sales_report_screen.dart';
import 'package:store/features/shop/screens/reports/searchs/user_search_screen.dart';
import 'package:store/features/shop/screens/reports/stock/stock_report_screen.dart';
import 'package:store/features/shop/screens/reports/wishlist/whishlist_screen.dart';
import 'package:store/features/shop/screens/sales/order_details/order_details_screen.dart';
import 'package:store/features/shop/screens/sales/orders/order_screen.dart';
import 'package:store/features/shop/screens/settings/shipping/shipping_settings_screen.dart';
import 'package:store/features/shop/screens/settings/store_settings/store_settings_screen.dart';
import 'package:store/features/shop/screens/stock/stock_recieved/stock_recived_screen.dart';
import 'package:store/features/shop/screens/stock/stock_requests/stock_requests_screen.dart';
import 'package:store/features/shop/screens/stock/stock_transfer/stock_transfer_screen.dart';
import 'package:store/features/shop/screens/support_tickets/responsive_screens/support_ticket_mobile_tablet_screen.dart';
import 'package:store/features/shop/screens/support_tickets/support_ticket_screen.dart';
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
      name: SRoutes.brands,
      middlewares: [TRouteMiddleware()],
      page: () => const BrandScreen(),
    ),
    GetPage(
      name: SRoutes.product,
      middlewares: [TRouteMiddleware()],
      page: () => const ProductsScreen(),
    ),
    GetPage(
      name: SRoutes.productReview,
      middlewares: [TRouteMiddleware()],
      page: () => const ProductReviewScreen(),
    ),
    GetPage(
      name: SRoutes.orders,
      middlewares: [TRouteMiddleware()],
      page: () => const OrderScreen(),
    ),
    GetPage(
      name: SRoutes.orderDetails,
      middlewares: [TRouteMiddleware()],
      page: () => const OrderDetailsScreen(),
    ),
    GetPage(
      name: SRoutes.customerRefund,
      middlewares: [TRouteMiddleware()],
      page: () => const CustomerRefundScreen(),
    ),
    GetPage(
      name: SRoutes.customers,
      middlewares: [TRouteMiddleware()],
      page: () => const CustomersScreen(),
    ),
    GetPage(
      name: SRoutes.stockRecived,
      middlewares: [TRouteMiddleware()],
      page: () => const StockRecivedScreen(),
    ),
    GetPage(
      name: SRoutes.stockRequests,
      middlewares: [TRouteMiddleware()],
      page: () => const StockRequestsScreen(),
    ),
    GetPage(
      name: SRoutes.stockTransfer,
      middlewares: [TRouteMiddleware()],
      page: () => const StockTransferScreen(),
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
      page: () => const SalesReportScreen(),
    ),
    GetPage(
      name: SRoutes.reportSearchs,
      middlewares: [TRouteMiddleware()],
      page: () => const UserSearchScreen(),
    ),
    GetPage(
      name: SRoutes.reportStock,
      middlewares: [TRouteMiddleware()],
      page: () => const StockReportScreen(),
    ),
    GetPage(
      name: SRoutes.reportWishlist,
      middlewares: [TRouteMiddleware()],
      page: () => const WhishlistScreen(),
    ),
    GetPage(
      name: SRoutes.accountCommission,
      middlewares: [TRouteMiddleware()],
      page: () => const CommissionHistoryScreen(),
    ),
    GetPage(
      name: SRoutes.accountPayment,
      middlewares: [TRouteMiddleware()],
      page: () => const PaymentHistoryScreen(),
    ),
    GetPage(
      name: SRoutes.accountRent,
      middlewares: [TRouteMiddleware()],
      page: () => const RentHistoryScreen(),
    ),
    GetPage(
      name: SRoutes.accountWithdraw,
      middlewares: [TRouteMiddleware()],
      page: () => const MoneyWithdrawalHistoryScreen(),
    ),
    GetPage(
      name: SRoutes.settingsMedia,
      middlewares: [TRouteMiddleware()],
      page: () => const MediaScreen(),
    ),
    GetPage(
      name: SRoutes.settingsShipping,
      middlewares: [TRouteMiddleware()],
      page: () => const ShippingSettingsScreen(),
    ),
    GetPage(
      name: SRoutes.settingsStore,
      middlewares: [TRouteMiddleware()],
      page: () => const StoreSettingsScreen(),
    ),
    GetPage(
      name: SRoutes.conversation,
      middlewares: [TRouteMiddleware()],
      page: () => const ConversationScreen(),
    ),
    GetPage(
      name: SRoutes.supportTicket,
      middlewares: [TRouteMiddleware()],
      page: () => const SupportTicketScreen(),
    ),
  ];
}
