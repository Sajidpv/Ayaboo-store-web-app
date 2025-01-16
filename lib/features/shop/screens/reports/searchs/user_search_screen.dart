import 'package:flutter/material.dart';
import 'package:store/common/widgets/layouts/templates/site_layout.dart';
import 'package:store/features/shop/screens/reports/searchs/responsive_screens/user_search_desktop_mobile_tablet_screen.dart';

class UserSearchScreen extends StatelessWidget {
  const UserSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SSiteLayout(
      desktop: UserSearchDesktopMobileTabletScreen(),
    );
  }
}
