class SRoutes {
  static const String n404 = '/page-not-found';
  static const String splash = '/';
  static const String login = '/login';
  static const String forgetPassword = '/forget-password';
  static const String resetPassword = '/reset-password';

  /////////Side nav items
  static const String dashboard = '/dashboard';
  static const String product = '/products';
  static const String sales = '/sales';
  static const String customerRefund = '/customer-refunds';
  static const String customers = '/customers';
  static const String stockManagement = '/stock-managment';
  static const String sellerManagment = '/saller-managment';
  static const String reports = '/reports';
  static const String accounts = '/accounts';
  static const String settings = '/settings';
  static const String conversation = '/conversations';
  static const String supportTicket = '/support-ticket';

  static const String category = '/category';
  static const String brands = '/brands';
  static const String createProduct = '/createProduct';
  static const String createBrand = '/createBrand';

  static List sideBarMenuItems = [
    dashboard,
    product,
    sales,
    customerRefund,
    customers,
    stockManagement,
    sellerManagment,
    reports,
    accounts,
    settings,
    conversation,
    supportTicket,
  ];
}
