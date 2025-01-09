import 'package:flutter/material.dart';
import 'package:store/common/widgets/breadcrumbs/breadcrumbs_with_heading.dart';
import 'package:store/features/shop/screens/brands/widgets/All_brand_table_widget.dart';
import 'package:store/features/shop/screens/brands/widgets/add_new_brand_section_widget.dart';

import 'package:store/utils/constants/sizes.dart';

class BrandDesktopScreen extends StatelessWidget {
  const BrandDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            spacing: TSizes.spaceBtwSections,
            children: [
              SBreadcrumbsWithHeading(breadcrumbItems: ['Brands']),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: TSizes.spaceBtwItems,
                children: [
                  Expanded(
                    flex: 2,
                    child: AllBrandTableWidget(),
                  ),
                  Expanded(
                    flex: 1,
                    child: AddNewBrandSectionWidget(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
