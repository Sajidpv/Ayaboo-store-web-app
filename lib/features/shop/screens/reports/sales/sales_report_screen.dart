import 'package:flutter/material.dart';
import 'package:store/common/widgets/layouts/templates/site_layout.dart';
import 'package:store/features/shop/screens/reports/sales/responsive_screens/sales_repost_desktop_mobile_tablet_screen.dart';

class SalesReportScreen extends StatelessWidget {
  const SalesReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SSiteLayout(
      desktop: SalesRepostDesktopMobileTabletScreen(),
    );
  }
}
