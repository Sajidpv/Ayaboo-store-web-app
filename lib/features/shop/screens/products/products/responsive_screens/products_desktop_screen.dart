import 'package:flutter/material.dart';
import 'package:store/common/widgets/breadcrumbs/breadcrumbs_with_heading.dart';
import 'package:store/common/widgets/containers/container_widget.dart';
import 'package:store/features/shop/screens/products/products/tables/product_table.dart';
import 'package:store/utils/constants/sizes.dart';

class ProductsDesktopScreen extends StatelessWidget {
  const ProductsDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            spacing: TSizes.spaceBtwItems,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SBreadcrumbsWithHeading(
                breadcrumbItems: const ['Products'],
                heading: 'All Products',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SContainerWidget(child: ProductTable())
            ],
          ),
        ),
      ),
    );
  }
}
