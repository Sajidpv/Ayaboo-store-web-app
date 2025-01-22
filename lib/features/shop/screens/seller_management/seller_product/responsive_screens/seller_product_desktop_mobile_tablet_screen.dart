import 'package:flutter/material.dart';
import 'package:store/common/widgets/breadcrumbs/breadcrumbs_with_heading.dart';
import 'package:store/features/shop/screens/seller_management/seller_product/tables/sample.dart';
import 'package:store/features/shop/screens/seller_management/seller_product/tables/seller_product_table.dart';
import 'package:store/utils/constants/sizes.dart';

class SellerProductDesktopMobileTabletScreen extends StatelessWidget {
  const SellerProductDesktopMobileTabletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            spacing: TSizes.defaultSpace,
            children: [
              SBreadcrumbsWithHeading(
                breadcrumbItems: ['Seller / Products'],
                heading: 'Product from seller',
              ),
              PaginatedExpandableTable()
            ],
          ),
        ),
      ),
    );
  }
}
