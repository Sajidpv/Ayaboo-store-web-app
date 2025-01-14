import 'package:flutter/widgets.dart';
import 'package:store/common/widgets/layouts/templates/site_layout.dart';
import 'package:store/features/shop/screens/customer.refunds/responsive_screens/customer_refunds_desktop_tablet_screen.dart';

class CustomerRefundScreen extends StatelessWidget {
  const CustomerRefundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SSiteLayout(
      desktop: CustomerRefundsDesktopTabletScreen(),
      // mobile: CustomerRefundsMobileScreen(),
    );
  }
}
