import 'package:flutter/material.dart';
import 'package:store/common/widgets/layouts/templates/site_layout.dart';
import 'package:store/features/shop/screens/seller_management/conversations/responsive_screens/conversation_mobile_tablet_screen.dart';

class SellerConversationScreen extends StatelessWidget {
  const SellerConversationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SSiteLayout(
      desktop: SellerConversationMobileTabletScreen(),
    );
  }
}
