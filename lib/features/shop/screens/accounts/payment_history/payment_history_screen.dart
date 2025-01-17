import 'package:flutter/material.dart';
import 'package:store/common/widgets/layouts/templates/site_layout.dart';
import 'package:store/features/shop/screens/accounts/payment_history/responsive_screens/payment_history_desktop_tablet_mobile_screen.dart';

class PaymentHistoryScreen extends StatelessWidget {
  const PaymentHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SSiteLayout(
      desktop: PaymentHistoryDesktopTabletMobileScreen(),
    );
  }
}
