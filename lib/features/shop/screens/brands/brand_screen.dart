import 'package:flutter/material.dart';
import 'package:store/common/widgets/layouts/templates/site_layout.dart';
import 'package:store/features/shop/screens/brands/responsive_screens/brand_desktop_screen.dart';
import 'package:store/features/shop/screens/brands/responsive_screens/brand_tablet_screen.dart';

class BrandScreen extends StatelessWidget {
  const BrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SSiteLayout(
      desktop: BrandDesktopScreen(),
      tablet: BrandTabletScreen(),
      // mobile: BrandMobileScreen(),
    );
  }
}
