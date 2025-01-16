import 'package:flutter/material.dart';
import 'package:store/common/widgets/layouts/templates/site_layout.dart';
import 'package:store/features/shop/screens/reports/wishlist/responsive_screens/whishlist_desktop_mobile_tablet_screen.dart';

class WhishlistScreen extends StatelessWidget {
  const WhishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SSiteLayout(
      desktop: WhishlistDesktopMobileTabletScreen(),
    );
  }
}
