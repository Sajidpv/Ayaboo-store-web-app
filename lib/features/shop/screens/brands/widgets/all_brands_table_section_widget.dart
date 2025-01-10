import 'package:flutter/material.dart';
import 'package:store/common/widgets/breadcrumbs/page_heading.dart';
import 'package:store/common/widgets/containers/container_widget.dart';
import 'package:store/features/shop/screens/brands/tables/brand_table.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/sizes.dart';

class AllBrandTableWidget extends StatelessWidget {
  const AllBrandTableWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SContainerWidget(
      elevation: .5,
      borderColor: TColors.accent,
      child: Column(
        spacing: TSizes.spaceBtwItems,
        children: [
          SPageHeading(
            heading: 'All Brands',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const BrandTable()
        ],
      ),
    );
  }
}
