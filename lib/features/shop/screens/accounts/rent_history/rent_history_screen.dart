import 'package:flutter/material.dart';
import 'package:store/common/widgets/layouts/templates/site_layout.dart';
import 'package:store/features/shop/screens/accounts/rent_history/responsive_screens/rent_history_desktop_tablet_mobile_screen.dart';

class RentHistoryScreen extends StatelessWidget {
  const RentHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SSiteLayout(
      desktop: RentHistoryDesktopTabletMobileScreen(),
    );
  }
}
