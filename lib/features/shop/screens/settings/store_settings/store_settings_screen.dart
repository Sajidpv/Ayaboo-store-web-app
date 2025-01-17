import 'package:flutter/material.dart';
import 'package:store/common/widgets/layouts/templates/site_layout.dart';
import 'package:store/features/shop/screens/settings/store_settings/responsive_screens/store_settings_mobile_tablet_screen.dart';

class StoreSettingsScreen extends StatelessWidget {
  const StoreSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SSiteLayout(
      desktop: StoreSettingsMobileTabletScreen(),
    );
  }
}
