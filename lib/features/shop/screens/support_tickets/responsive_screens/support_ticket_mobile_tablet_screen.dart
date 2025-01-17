import 'package:flutter/material.dart';
import 'package:store/common/widgets/breadcrumbs/breadcrumbs_with_heading.dart';
import 'package:store/utils/constants/sizes.dart';

class SupportTicketMobileTabletScreen extends StatelessWidget {
  const SupportTicketMobileTabletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            spacing: TSizes.defaultSpace,
            children: [
              SBreadcrumbsWithHeading(
                breadcrumbItems: ['Support Tickets'],
                heading: 'Support Tickets',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
