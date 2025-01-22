import 'package:flutter/material.dart';
import 'package:store/common/widgets/layouts/templates/site_layout.dart';
import 'package:store/features/shop/screens/seller_management/seller_product/responsive_screens/seller_product_desktop_mobile_tablet_screen.dart';

class SellerProductScreen extends StatelessWidget {
  const SellerProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SSiteLayout(
      desktop: SellerProductDesktopMobileTabletScreen(),
    );
  }
}
