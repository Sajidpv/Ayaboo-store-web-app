import 'package:flutter/material.dart';
import 'package:store/common/widgets/breadcrumbs/breadcrumbs_with_heading.dart';
import 'package:store/features/shop/screens/reports/table_data/report_table.dart';
import 'package:store/utils/constants/sizes.dart';

class WhishlistDesktopMobileTabletScreen extends StatelessWidget {
  const WhishlistDesktopMobileTabletScreen({super.key});

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
                breadcrumbItems: ['Reports / Whishlist'],
                heading: 'Wishlist',
              ),
              ReportTable(
                trailing: 'Number of Wishes',
              )
            ],
          ),
        ),
      ),
    );
  }
}
