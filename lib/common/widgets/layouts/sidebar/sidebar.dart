import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/layouts/sidebar/menu/menu_item.dart';
import 'package:store/routes/routes.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/image_strings.dart';
import 'package:store/utils/constants/sizes.dart';
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => Get.offAllNamed(SRoutes.dashboard),
                child: SvgPicture.asset(
                  SImages.lightAppLogo,
                  width: 150,
                  fit: BoxFit.cover,
                ).showCursorOnHover,
              ),
              Column(
                spacing: TSizes.md,
                children: [
                  TSizes.md.height,
                  const MenuItem(
                    route: SRoutes.dashboard,
                    icon: Icons.dashboard,
                    itemName: 'Dashboard',
                  ),
                  const MenuItem(
                    route: SRoutes.product,
                    icon: Icons.dashboard,
                    itemName: 'Products',
                  ),
                  const MenuItem(
                    route: SRoutes.sales,
                    icon: Icons.dashboard,
                    itemName: 'Sales',
                  ),
                  const MenuItem(
                    route: SRoutes.customerRefund,
                    icon: Icons.dashboard,
                    itemName: 'Customer Refunds',
                  ),
                  const MenuItem(
                    route: SRoutes.customers,
                    icon: Icons.dashboard,
                    itemName: 'Customers',
                  ),
                  const MenuItem(
                    route: SRoutes.stockManagement,
                    icon: Icons.dashboard,
                    itemName: 'Stock Management',
                  ),
                  const MenuItem(
                    route: SRoutes.sellerManagment,
                    icon: Icons.dashboard,
                    itemName: 'Seller Management',
                  ),
                  const MenuItem(
                    route: SRoutes.reports,
                    icon: Icons.dashboard,
                    itemName: 'Reports',
                  ),
                  const MenuItem(
                    route: SRoutes.accounts,
                    icon: Icons.dashboard,
                    itemName: 'Accounts',
                  ),
                  const MenuItem(
                    route: SRoutes.settings,
                    icon: Icons.dashboard,
                    itemName: 'Settings',
                  ),
                  const MenuItem(
                    route: SRoutes.conversation,
                    icon: Icons.dashboard,
                    itemName: 'Conversations',
                  ),
                  const MenuItem(
                    route: SRoutes.supportTicket,
                    icon: Icons.dashboard,
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
