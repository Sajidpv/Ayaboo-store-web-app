import 'package:flutter/material.dart';
import 'package:store/common/widgets/breadcrumbs/breadcrumbs_with_heading.dart';
import 'package:store/utils/constants/sizes.dart';

class ProductReviewsDesktopScreen extends StatelessWidget {
  const ProductReviewsDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              SBreadcrumbsWithHeading(
                breadcrumbItems: const ['Product Reviews'],
                heading: 'Product Reviews',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
