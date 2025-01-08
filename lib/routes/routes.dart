class SRoutes {
  static const String n404 = '/not-found';

  static const String welcome = '/';
  static const String login = '/login';
  static const String forgetPassword = '/forget-password';
  static const String resetPassword = '/reset-password';

  static const String category = '/category';
  static const String brands = '/brands';
  static const String createProduct = '/createProduct';
  static const String createBrand = '/createBrand';
  /////////Side nav items
  static const String dashboard = '/dashboard';
  static const String product = '/products';
  static const String productReview = '/products/review';
  static const String sales = '/sales/orders';
  static const String customerRefund = '/customer-refunds';
  static const String customers = '/customers';
  static const String stockTransfer = '/stock/transfer';
  static const String stockRecived = '/stock/recieved';
  static const String stockReturns = '/stock/return';
  static const String sellerProducts = '/seller/products';
  static const String sellerReturns = '/seller/returns';
  static const String sellerConversation = '/seller/conversation';
  static const String sellerStocks = '/seller/stocks';
  static const String reportSale = '/reports/sales';
  static const String reportWishlist = '/reports/whishlist';
  static const String reportStock = '/reports/stock';
  static const String reportSearchs = '/reports/searches';
  static const String accountRent = '/accounts/rent';
  static const String accountCommission = '/accounts/commission';
  static const String accountWithdraw = '/accounts/withdraw';
  static const String accountPayment = '/accounts/payments';
  static const String settingsMedia = '/settings/media';
  static const String settingsStore = '/settings/store';
  static const String settingsShipping = '/settings/shipping';
  static const String conversation = '/conversations';
  static const String supportTicket = '/support-ticket';

  static List sideBarMenuItems = [
    dashboard,
    product,
    productReview,
    sales,
    customerRefund,
    customers,
    stockTransfer,
    stockRecived,
    stockReturns,
    sellerProducts,
    sellerReturns,
    sellerConversation,
    sellerStocks,
    reportSale,
    reportWishlist,
    reportStock,
    reportSearchs,
    accountRent,
    accountCommission,
    accountWithdraw,
    accountPayment,
    settingsStore,
    settingsShipping,
    conversation,
    supportTicket
  ];
  static List allRoutes = [
    dashboard,
    product,
    productReview,
    sales,
    customerRefund,
    customers,
    stockTransfer,
    stockRecived,
    stockReturns,
    sellerProducts,
    sellerReturns,
    sellerConversation,
    sellerStocks,
    reportSale,
    reportWishlist,
    reportStock,
    reportSearchs,
    accountRent,
    accountCommission,
    accountWithdraw,
    accountPayment,
    settingsStore,
    settingsShipping,
    conversation,
    supportTicket,
    welcome,
    login,
    forgetPassword,
    resetPassword,
    category,
    brands,
    createProduct,
    createBrand,
  ];
}
