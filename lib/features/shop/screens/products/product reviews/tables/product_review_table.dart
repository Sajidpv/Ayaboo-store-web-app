import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:store/common/widgets/containers/container_widget.dart';
import 'package:store/common/widgets/data_table/paginated_data_table.dart';
import 'package:store/common/widgets/filters/search_box.dart';
import 'package:store/common/widgets/filters/sort_dropdown_section.dart';
import 'package:store/features/shop/screens/products/product%20reviews/tables/product_review_source_row.dart';
import 'package:store/utils/constants/colors.dart';
import 'package:store/utils/constants/enums.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/device/device_utility.dart';
import 'package:store/utils/extensions/device_size_extensions.dart';

class ProductReviewTable extends StatelessWidget {
  const ProductReviewTable({super.key});

  @override
  Widget build(BuildContext context) {
    return SContainerWidget(
      child: Column(
        spacing: TSizes.spaceBtwItems,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!SDeviceUtils.isMobileScreen(context))
            Row(
              spacing: TSizes.spaceBtwItems,
              children: [
                const SearchBox(
                  hint: 'Search by product name',
                ),
                SizedBox(
                  width: 200,
                  child: SCustomDropDown(
                    selectedValue: VerificationStatus.all,
                    onChanged: (p0) {},
                    values: VerificationStatus.values,
                  ),
                )
              ],
            ),
          if (SDeviceUtils.isMobileScreen(context))
            const SearchBox(
              hint: 'Search by product name',
            ),
          if (SDeviceUtils.isMobileScreen(context))
            SizedBox(
              width: 200,
              child: SCustomDropDown(
                selectedValue: VerificationStatus.all,
                values: VerificationStatus.values,
                onChanged: (p0) {},
              ),
            ),
          SPaginatedDataTable(
            headerColor: TColors.white,
            tableHeight: context.mediaQueryHeight - 350,
            dataRowHeight: 64,
            columns: const [
              DataColumn2(label: Text('#'), fixedWidth: 40),
              DataColumn2(
                label: Text('Product'),
              ),
              DataColumn2(label: Text('Customer'), fixedWidth: 150),
              DataColumn2(label: Text('Rating'), fixedWidth: 90),
              DataColumn2(
                label: Text('Review'),
              ),
              DataColumn2(label: Text('Status'), fixedWidth: 100),
              DataColumn2(label: Text('Actions'), fixedWidth: 60),
            ],
            source: ProductReviewSourceRows(),
          ),
        ],
      ),
    );
  }
}
