import 'package:flutter/material.dart';
import 'package:store/common/widgets/layouts/templates/site_layout.dart';
import 'package:store/features/shop/screens/support_tickets/responsive_screens/support_ticket_mobile_tablet_screen.dart';

class SupportTicketScreen extends StatelessWidget {
  const SupportTicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SSiteLayout(
      desktop: SupportTicketMobileTabletScreen(),
    );
  }
}
