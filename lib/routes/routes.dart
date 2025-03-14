class SRoutes {
  static const String n404 = '/not-found';

  static const String welcome = '/';
  static const String login = '/login';
  static const String forgetPassword = '/forget-password';
  static const String resetPassword = '/reset-password';

  static const String createBrand = '/create-brand';
  static const String editBrand = '/edit-brand';
  static const String deleteBrand = '/delete-brand';
  /////////Side nav items
  static const String dashboard = '/dashboard';
  static const String brands = '/brands';

  static const String product = '/products';
  static const String productReview = '/products/review';
  static const String createProduct = '/products/create-product';
  static const String orders = '/sales/orders';
  static const String orderDetails = '/sales/orders/order-details';
  static const String customerRefund = '/customer-refunds';
  static const String customers = '/customers';
  static const String stockTransfer = '/stock/transfer';
  static const String stockRecived = '/stock/recieved';
  static const String stockRequests = '/stock/requests';
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
  static const String conversationChat = '/conversations/chat';
  static const String supportTicket = '/support-ticket';

  static List sideBarMenuItems = [
    brands,
    createBrand,
    createProduct,
    dashboard,
    product,
    productReview,
    orders,
    customerRefund,
    customers,
    stockTransfer,
    stockRecived,
    stockRequests,
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
    brands,
    createBrand,
    createProduct,
    product,
    productReview,
    orders,
    orderDetails,
    customerRefund,
    customers,
    stockTransfer,
    stockRecived,
    stockRequests,
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
    brands,
    createProduct,
    createBrand,
  ];
}
