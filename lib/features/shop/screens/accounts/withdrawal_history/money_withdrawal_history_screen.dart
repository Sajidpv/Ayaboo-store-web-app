import 'package:flutter/material.dart';
import 'package:store/common/widgets/layouts/templates/site_layout.dart';
import 'package:store/features/shop/screens/accounts/withdrawal_history/responsive_screens/money_withdrawal_history_desktop_tablet_mobile_screen.dart';

class MoneyWithdrawalHistoryScreen extends StatelessWidget {
  const MoneyWithdrawalHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SSiteLayout(
      desktop: MoneyWithdrawalHistoryDesktopTabletMobileScreen(),
    );
  }
}
