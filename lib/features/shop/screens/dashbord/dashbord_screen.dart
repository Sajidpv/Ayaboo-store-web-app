import 'package:flutter/material.dart';
import 'package:store/common/widgets/layouts/templates/site_layout.dart';
import 'package:store/features/shop/screens/dashbord/responsive_screens/dashboard_desktop_screen.dart';
import 'package:store/features/shop/screens/dashbord/responsive_screens/dashbord_mobile_screen.dart';
import 'package:store/features/shop/screens/dashbord/responsive_screens/dashbord_tablet_screen.dart';

class DashbordScreen extends StatelessWidget {
  const DashbordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SSiteLayout(
      desktop: DashboardDesktopScreen(),
      mobile: DashbordMobileScreen(),
      tablet: DashbordTabletScreen(),
    );
  }
}
