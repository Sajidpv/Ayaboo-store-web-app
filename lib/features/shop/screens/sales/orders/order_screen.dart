import 'package:flutter/material.dart';
import 'package:store/common/widgets/layouts/templates/site_layout.dart';
import 'package:store/features/shop/screens/sales/orders/responsive_screens/order_desktop_tab_mobile_screen.dart';
// import 'package:store/features/shop/screens/sales/responsive_screens/sales_mobile_screen.dart';
// import 'package:store/features/shop/screens/sales/responsive_screens/sales_tablet_screen.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SSiteLayout(
      desktop: OrderDesktopScreen(),
      // tablet: SalesTabletScreen(),
      // mobile: SalesMobileScreen(),
    );
  }
}
