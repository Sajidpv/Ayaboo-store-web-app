import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/layouts/sidebar/menu/menu_item.dart';
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
                  width: 150,
                  fit: BoxFit.cover,
                ).showCursorOnHover,
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
              Column(
                spacing: TSizes.md,
                children: [
                  const MenuItem(
                    route: SRoutes.dashboard,
                    image: SImages.sidDashboardIcon,
                    itemName: 'Dashboard',
                  ),
                  const MenuItem(
                    image: SImages.sideProductICon,
                    itemName: 'Products',
                    children: [
                      MenuItem(
                        route: SRoutes.product,
                        itemName: 'All Products',
                      ),
                      MenuItem(
                        route: SRoutes.product,
                        itemName: 'Product Reviews',
                      ),
                    ],
                  ),
                  const MenuItem(
                    image: SImages.sideSaleIcon,
                    itemName: 'Sales',
                    children: [
                      MenuItem(
                        route: SRoutes.sales,
                        itemName: 'All Orders',
                      ),
                    ],
                  ),
                  1.height,
                  const MenuItem(
                    route: SRoutes.customerRefund,
                    image: SImages.sideRefundIcon,
                    itemName: 'Customer Refunds',
                  ),
                  1.height,
                  const MenuItem(
                    route: SRoutes.customers,
                    image: SImages.sideCustICon,
                    itemName: 'Customers',
                  ),
                  const MenuItem(
                    route: SRoutes.stockManagement,
                    image: SImages.sideStockICon,
                    itemName: 'Stock Management',
                    children: [
                      MenuItem(
                        route: SRoutes.dashboard,
                        itemName: 'Stock Transfer',
                      ),
                      MenuItem(
                        route: SRoutes.dashboard,
                        itemName: 'Stock Recived',
                      ),
                      MenuItem(route: '', itemName: 'Returns')
                    ],
                  ),
                  const MenuItem(
                    route: SRoutes.sellerManagment,
                    image: SImages.sideSellerIcon,
                    itemName: 'Seller Management',
                    children: [
                      MenuItem(
                        route: SRoutes.dashboard,
                        itemName: 'New Product from seller',
                      ),
                      MenuItem(
                        route: SRoutes.dashboard,
                        itemName: 'Stock request',
                      ),
                      MenuItem(
                        route: SRoutes.dashboard,
                        itemName: 'Conversations',
                      ),
                      MenuItem(
                        route: SRoutes.dashboard,
                        itemName: 'Return to seller',
                      ),
                    ],
                  ),
                  const MenuItem(
                    route: SRoutes.reports,
                    image: SImages.sideReportIcon,
                    itemName: 'Reports',
                    children: [
                      MenuItem(
                        route: SRoutes.dashboard,
                        itemName: 'Product Sale',
                      ),
                      MenuItem(
                        route: SRoutes.dashboard,
                        itemName: 'Product Stock',
                      ),
                      MenuItem(
                        route: SRoutes.dashboard,
                        itemName: 'Product Wishlist',
                      ),
                      MenuItem(
                        route: SRoutes.dashboard,
                        itemName: 'User Searches',
                      ),
                    ],
                  ),
                  const MenuItem(
                    route: SRoutes.accounts,
                    image: SImages.sideAccountIcon,
                    itemName: 'Accounts',
                    children: [
                      MenuItem(
                        route: SRoutes.dashboard,
                        itemName: 'Payment History',
                      ),
                      MenuItem(
                        route: SRoutes.dashboard,
                        itemName: 'Rent History',
                      ),
                      MenuItem(
                        route: SRoutes.dashboard,
                        itemName: 'Commission History',
                      ),
                      MenuItem(
                        route: SRoutes.dashboard,
                        itemName: 'Money Withdraw History',
                      ),
                    ],
                  ),
                  const MenuItem(
                    route: SRoutes.settings,
                    image: SImages.sideSettingIcon,
                    itemName: 'Settings',
                    children: [
                      MenuItem(
                        route: SRoutes.dashboard,
                        itemName: 'Store Settings',
                      ),
                      MenuItem(
                        route: SRoutes.dashboard,
                        itemName: 'Shipping',
                      ),
                    ],
                  ),
                  const MenuItem(
                    route: SRoutes.conversation,
                    itemName: 'Conversations',
                  ),
                  const MenuItem(
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
