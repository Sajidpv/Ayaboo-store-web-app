import 'package:flutter/material.dart';
import 'package:store/common/widgets/breadcrumbs/breadcrumbs_with_heading.dart';
import 'package:store/features/shop/screens/sales/table/sales_table.dart';
import 'package:store/utils/constants/sizes.dart';

class SalesDesktopScreen extends StatelessWidget {
  const SalesDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.lg),
          child: Column(
            spacing: TSizes.spaceBtwItems,
            children: [
              SBreadcrumbsWithHeading(
                breadcrumbItems: const ['Orders'],
                heading: 'All Orders',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SalesTable(),
            ],
          ),
        ),
      ),
    );
  }
}
