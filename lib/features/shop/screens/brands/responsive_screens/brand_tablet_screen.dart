import 'package:flutter/material.dart';
import 'package:store/common/widgets/breadcrumbs/breadcrumbs_with_heading.dart';
import 'package:store/common/widgets/filters/search_box.dart';
import 'package:store/features/shop/screens/brands/widgets/add_new_brand_section_widget.dart';
import 'package:store/features/shop/screens/brands/widgets/all_brands_table_section_widget.dart';
import 'package:store/utils/constants/sizes.dart';

class BrandTabletScreen extends StatelessWidget {
  const BrandTabletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: TSizes.spaceBtwSections,
            children: [
              SBreadcrumbsWithHeading(breadcrumbItems: ['Brands']),
              SearchBox(
                hint: 'Search by Brand Name',
              ),
              AllBrandTableWidget(),
              AddNewBrandSectionWidget()
            ],
          ),
        ),
      ),
    );
  }
}
