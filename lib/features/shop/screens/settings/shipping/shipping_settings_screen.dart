import 'package:flutter/material.dart';
import 'package:store/common/widgets/layouts/templates/site_layout.dart';
import 'package:store/features/shop/screens/settings/shipping/responsive_screens/shipping_settings_mobile_tablet_screen.dart';

class ShippingSettingsScreen extends StatelessWidget {
  const ShippingSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SSiteLayout(
      desktop: ShippingSettingsMobileTabletScreen(),
    );
  }
}
