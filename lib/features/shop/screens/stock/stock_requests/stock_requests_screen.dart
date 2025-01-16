import 'package:flutter/material.dart';
import 'package:store/common/widgets/layouts/templates/site_layout.dart';
import 'package:store/features/shop/screens/stock/stock_requests/responsive_screens/stock_request_desktop_screen.dart';
import 'package:store/features/shop/screens/stock/stock_requests/responsive_screens/stock_request_tablet_mobile_screen.dart';

class StockRequestsScreen extends StatelessWidget {
  const StockRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SSiteLayout(
      desktop: StockRequestDesktopScreen(),
      tablet: StockRequestTabletMobileScreen(),
    );
  }
}
