import 'package:flutter/material.dart';
import 'package:store/common/widgets/breadcrumbs/breadcrumbs_with_heading.dart';
import 'package:store/features/shop/screens/customers/tables/customers_table.dart';
import 'package:store/utils/constants/sizes.dart';

class CustomersDesktopTabletMobileScreen extends StatelessWidget {
  const CustomersDesktopTabletMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: SingleChildScrollView(
          child: Column(
            spacing: TSizes.defaultSpace,
            children: [
              SBreadcrumbsWithHeading(
                breadcrumbItems: ['Customers'],
                heading: 'Customers',
              ),
              CustomersTable()
            ],
          ),
        ),
      ),
    );
  }
}
