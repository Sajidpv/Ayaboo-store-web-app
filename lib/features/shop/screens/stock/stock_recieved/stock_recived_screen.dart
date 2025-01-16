import 'package:flutter/material.dart';
import 'package:store/common/widgets/layouts/templates/site_layout.dart';
import 'package:store/features/shop/screens/stock/stock_recieved/responsive_screens/stock_recived_desktop_mobile_tablet_screen.dart';

class StockRecivedScreen extends StatelessWidget {
  const StockRecivedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SSiteLayout(
      desktop: StockRecivedDesktopMobileTabletScreen(),
    );
  }
}
