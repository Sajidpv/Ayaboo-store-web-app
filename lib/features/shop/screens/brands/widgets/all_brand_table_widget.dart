import 'package:flutter/material.dart';
import 'package:store/common/widgets/breadcrumbs/page_heading.dart';
import 'package:store/common/widgets/containers/container_widget.dart';
import 'package:store/features/shop/screens/brands/tables/brand_table.dart';
import 'package:store/utils/constants/colors.dart';

class AllBrandTableWidget extends StatelessWidget {
  const AllBrandTableWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SContainerWidget(
      elevation: .5,
      borderColor: TColors.accent,
      child: Column(
        children: [SPageHeading(heading: 'All Brands'), BrandTable()],
      ),
    );
  }
}
