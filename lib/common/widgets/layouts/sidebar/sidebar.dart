import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/layouts/sidebar/widgets/menu_item.dart';
import 'package:store/routes/routes.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/device/device_utility.dart';
import 'package:store/utils/extensions/hover_extension.dart';
import 'package:store/utils/extensions/spacer_extension.dart';

class SSidebar extends StatelessWidget {
  const SSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const BeveledRectangleBorder(),
      child: Container(
        padding: const EdgeInsets.symmetric(
            vertical: TSizes.lg, horizontal: TSizes.md),
        decoration: const BoxDecoration(
            color: TColors.blackAccent,
            border: Border(
                right: BorderSide(color: TColors.blackAccent, width: 1))),
        child: SingleChildScrollView(
          child: Column(
            spacing: TSizes.defaultSpace,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (SDeviceUtils.isMobileScreen(context) && !kIsWeb)
                TSizes.appBarHeight.height,
              InkWell(
                onTap: () => Get.offAllNamed(SRoutes.dashboard),
                child: SvgPicture.asset(
                  SImages.lightAppLogo,
                  width: 120,
                  fit: BoxFit.cover,
                ).showCursorOnHoverIfWeb,
              ),
              SizedBox(
                child: Theme(
                  data: Theme.of(context).copyWith(
                    inputDecorationTheme: InputDecorationTheme(
                      filled: true,
                      fillColor: TColors.black.withValues(alpha: .8),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(TSizes.inputFieldRadius),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Search...',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
              const Column(
                spacing: TSizes.md,
                children: [
                  MenuItem(
                    route: SRoutes.dashboard,
                    image: SImages.sidDashboardIcon,
                    itemName: 'Dashboard',
                  ),
                  MenuItem(
                    parent: 'products',
                    image: SImages.sideProductICon,
                    itemName: 'Products',
                    children: [
                      MenuItem(
                        route: SRoutes.brands,
                        itemName: 'Brands',
                      ),
                      MenuItem(
                        route: SRoutes.product,
                        itemName: 'All Products',
                      ),
                      MenuItem(
                        route: SRoutes.productReview,
                        itemName: 'Product Reviews',
                      ),
                    ],
                  ),
                  MenuItem(
                    parent: 'sales',
                    image: SImages.sideSaleIcon,
                    itemName: 'Sales',
                    children: [
                      MenuItem(
                        route: SRoutes.sales,
                        itemName: 'All Orders',
                      ),
                    ],
                  ),
                  MenuItem(
                    route: SRoutes.customerRefund,
                    image: SImages.sideRefundIcon,
                    itemName: 'Customer Refunds',
                  ),
                  MenuItem(
                    route: SRoutes.n404,
                    image: SImages.sideCustICon,
                    itemName: 'Customers',
                  ),
                  MenuItem(
                    parent: 'stock',
                    image: SImages.sideStockICon,
                    itemName: 'Stock Management',
                    children: [
                      MenuItem(
                        route: SRoutes.stockTransfer,
                        itemName: 'Stock Transfer',
                      ),
                      MenuItem(
                        route: SRoutes.stockRecived,
                        itemName: 'Stock Recived',
                      ),
                      MenuItem(route: SRoutes.stockReturns, itemName: 'Returns')
                    ],
                  ),
                  MenuItem(
                    parent: 'seller',
                    image: SImages.sideSellerIcon,
                    itemName: 'Seller Management',
                    children: [
                      MenuItem(
                        route: SRoutes.sellerProducts,
                        itemName: 'New Product from seller',
                      ),
                      MenuItem(
                        route: SRoutes.sellerStocks,
                        itemName: 'Stock request',
                      ),
                      MenuItem(
                        route: SRoutes.sellerConversation,
                        itemName: 'Conversations',
                      ),
                      MenuItem(
                        route: SRoutes.sellerReturns,
                        itemName: 'Return to seller',
                      ),
                    ],
                  ),
                  MenuItem(
                    parent: 'reports',
                    image: SImages.sideReportIcon,
                    itemName: 'Reports',
                    children: [
                      MenuItem(
                        route: SRoutes.reportSale,
                        itemName: 'Product Sale',
                      ),
                      MenuItem(
                        route: SRoutes.reportStock,
                        itemName: 'Product Stock',
                      ),
                      MenuItem(
                        route: SRoutes.reportWishlist,
                        itemName: 'Product Wishlist',
                      ),
                      MenuItem(
                        route: SRoutes.reportSearchs,
                        itemName: 'User Searches',
                      ),
                    ],
                  ),
                  MenuItem(
                    parent: 'accounts',
                    image: SImages.sideAccountIcon,
                    itemName: 'Accounts',
                    children: [
                      MenuItem(
                        route: SRoutes.accountPayment,
                        itemName: 'Payment History',
                      ),
                      MenuItem(
                        route: SRoutes.accountRent,
                        itemName: 'Rent History',
                      ),
                      MenuItem(
                        route: SRoutes.accountCommission,
                        itemName: 'Commission History',
                      ),
                      MenuItem(
                        route: SRoutes.accountWithdraw,
                        itemName: 'Money Withdraw History',
                      ),
                    ],
                  ),
                  MenuItem(
                    parent: 'settings',
                    image: SImages.sideSettingIcon,
                    itemName: 'Settings',
                    children: [
                      MenuItem(
                        route: SRoutes.settingsMedia,
                        itemName: 'Media',
                      ),
                      MenuItem(
                        route: SRoutes.settingsStore,
                        itemName: 'Store Settings',
                      ),
                      MenuItem(
                        route: SRoutes.settingsShipping,
                        itemName: 'Shipping',
                      ),
                    ],
                  ),
                  MenuItem(
                    image: SImages.sideSettingIcon,
                    route: SRoutes.conversation,
                    itemName: 'Conversations',
                  ),
                  MenuItem(
                    image: SImages.sideSettingIcon,
                    route: SRoutes.supportTicket,
                    itemName: 'Support Ticket',
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
