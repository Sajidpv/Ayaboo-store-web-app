import 'package:flutter/material.dart';
import 'package:store/common/widgets/layouts/templates/site_layout.dart';
import 'package:store/features/shop/screens/reports/stock/responsive_screens/stock_report_desktop_mobile_tablet_screen.dart';

class StockReportScreen extends StatelessWidget {
  const StockReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SSiteLayout(
      desktop: StockReportDesktopMobileTabletScreen(),
    );
  }
}
