import 'package:flutter/widgets.dart';
import 'package:store/common/widgets/layouts/templates/site_layout.dart';
import 'package:store/features/shop/screens/sales/order_details/responsive_screens/order_details_desktop_tablet_screen.dart';
import 'package:store/features/shop/screens/sales/order_details/responsive_screens/order_details_mobile_screen.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SSiteLayout(
      desktop: OrderDetailsDesktopTabMobileScreen(),
      mobile: OrderDetailsMobileScreen(),
    );
  }
}
