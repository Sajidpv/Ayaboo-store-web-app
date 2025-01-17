import 'package:flutter/material.dart';
import 'package:store/common/widgets/layouts/templates/site_layout.dart';
import 'package:store/features/shop/screens/accounts/commission_history/responsive_screens/commission_history_desktop_tablet_mobile_screen.dart';

class CommissionHistoryScreen extends StatelessWidget {
  const CommissionHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SSiteLayout(
      desktop: CommissionHistoryDesktopTabletMobileScreen(),
    );
  }
}
