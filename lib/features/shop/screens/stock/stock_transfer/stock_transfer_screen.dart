import 'package:flutter/material.dart';
import 'package:store/common/widgets/layouts/templates/site_layout.dart';
import 'package:store/features/shop/screens/stock/stock_transfer/responsive_screens/stock_transfer_desktop_tablet_mobile_screen.dart';

class StockTransferScreen extends StatelessWidget {
  const StockTransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SSiteLayout(
      desktop: StockTransferDesktopTabletMobileScreen(),
    );
  }
}
