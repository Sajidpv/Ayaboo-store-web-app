import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:store/common/widgets/containers/container_widget.dart';
import 'package:store/common/widgets/data_table/paginated_data_table.dart';
import 'package:store/common/widgets/filters/search_box.dart';
import 'package:store/common/widgets/filters/sort_dropdown_section.dart';
import 'package:store/features/shop/screens/products/products/tables/product_source_row.dart';
import 'package:store/utils/constants/enums.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/device/device_utility.dart';
import 'package:store/utils/extensions/device_size_extensions.dart';

class ProductTable extends StatelessWidget {
  const ProductTable({super.key});

  @override
  Widget build(BuildContext context) {
    return SContainerWidget(
      child: Column(
        spacing: TSizes.spaceBtwItems,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!SDeviceUtils.isMobileScreen(context))
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: TSizes.spaceBtwItems,
              children: [
                const SearchBox(
                  hint: 'Search by product name',
                ),
                SizedBox(
                  width: 200,
                  child: SCustomDropDown(
                    onChanged: (p0) {},
                    selectedValue: SortProduct.all,
                    values: SortProduct.values,
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
                onChanged: (p0) {},
                selectedValue: SortProduct.all,
                values: SortProduct.values,
              ),
            ),
          SPaginatedDataTable(
            tableHeight: context.mediaQueryHeight,
            dataRowHeight: 200,
            columns: const [
              DataColumn2(label: Text('#'), fixedWidth: 40),
              DataColumn2(
                label: Text(
                  'Product',
                ),
                fixedWidth: 300,
              ),
              DataColumn2(
                label: Text('Seller'),
              ),
              DataColumn2(
                label: Text('Varients'),
                fixedWidth: 150,
              ),
              DataColumn2(
                label: Text('Total Stock'),
              ),
              DataColumn2(
                label: Text('Discount'),
              ),
              DataColumn2(
                label: Text('Selling Price'),
              ),
              DataColumn2(
                label: Text('Price/Pieces'),
              ),
              DataColumn2(
                label: Text('Sample Price'),
              ),
              DataColumn2(
                label: Text('MRP'),
              ),
              DataColumn2(
                label: Text('Status'),
              ),
              DataColumn2(
                label: Text('Todays deal'),
              ),
              DataColumn2(
                label: Text('Published'),
              ),
              DataColumn2(
                label: Text('Featured'),
              ),
              DataColumn2(
                label: Text('Actions'),
              ),
            ],
            source: ProductSourceRow(),
          ),
        ],
      ),
    );
  }
}
