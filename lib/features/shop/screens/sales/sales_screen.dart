import 'package:flutter/material.dart';
import 'package:store/common/widgets/layouts/templates/site_layout.dart';
import 'package:store/features/shop/screens/sales/responsive_screens/sales_desktop_screen.dart';
// import 'package:store/features/shop/screens/sales/responsive_screens/sales_mobile_screen.dart';
// import 'package:store/features/shop/screens/sales/responsive_screens/sales_tablet_screen.dart';

class SalesScreen extends StatelessWidget {
  const SalesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SSiteLayout(
      desktop: SalesDesktopScreen(),
      // tablet: SalesTabletScreen(),
      // mobile: SalesMobileScreen(),
    );
  }
}
