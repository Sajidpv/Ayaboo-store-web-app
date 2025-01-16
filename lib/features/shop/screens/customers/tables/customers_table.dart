import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:store/common/widgets/containers/container_widget.dart';
import 'package:store/common/widgets/data_table/paginated_data_table.dart';
import 'package:store/common/widgets/filters/search_box.dart';
import 'package:store/features/shop/screens/customers/tables/customers_source_row.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/device/device_utility.dart';

class CustomersTable extends StatelessWidget {
  const CustomersTable({super.key});

  @override
  Widget build(BuildContext context) {
    return SContainerWidget(
      child: Column(
        spacing: TSizes.spaceBtwItems,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!SDeviceUtils.isMobileScreen(context))
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: TSizes.spaceBtwItems,
              children: [
                SearchBox(
                  hint: 'Search by name or email',
                ),
                // SizedBox(
                //   width: 200,
                //   child: SortDropDown(
                //     onChanged: (p0) {},
                //     selectedValue: SortProduct.all,
                //     values: SortProduct.values,
                //   ),
                // )
              ],
            ),
          if (SDeviceUtils.isMobileScreen(context))
            const SearchBox(
              hint: 'Search by name or email',
            ),
          // if (SDeviceUtils.isMobileScreen(context))
          //   SizedBox(
          //     width: 200,
          //     child: SortDropDown(
          //       onChanged: (p0) {},
          //       selectedValue: SortProduct.all,
          //       values: SortProduct.values,
          //     ),
          //   ),
          SPaginatedDataTable(
            tableHeight: 760,
            columns: const [
              DataColumn2(
                label: Text('Name'),
              ),
              DataColumn2(
                label: Text(
                  'Email',
                ),
              ),
              DataColumn2(
                label: Text('Phone'),
              ),
              DataColumn2(
                label: Text('Gst No.'),
              ),
              DataColumn2(
                label: Text('Pin'),
              ),
              DataColumn2(
                label: Text('Building No'),
              ),
              DataColumn2(
                label: Text('City'),
              ),
              DataColumn2(
                label: Text('State'),
              ),
              DataColumn2(
                label: Text('Country'),
              ),
              DataColumn2(
                label: Text('Actions'),
              ),
            ],
            source: CustomersSourceRow(),
          ),
        ],
      ),
    );
  }
}
