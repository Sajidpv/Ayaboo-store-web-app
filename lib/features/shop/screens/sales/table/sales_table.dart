import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/common/widgets/containers/container_widget.dart';
import 'package:store/common/widgets/data_table/paginated_data_table.dart';
import 'package:store/common/widgets/filters/search_box.dart';
import 'package:store/common/widgets/filters/sort_dropdown_section.dart';
import 'package:store/features/shop/controller/sales/sales_controller.dart';
import 'package:store/features/shop/screens/sales/table/sale_table_source_row.dart';
import 'package:store/utils/constants/enums.dart';
import 'package:store/utils/constants/sizes.dart';
import 'package:store/utils/device/device_utility.dart';

class SalesTable extends StatelessWidget {
  const SalesTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final SalesController controller = Get.put(SalesController());
    return SContainerWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        spacing: TSizes.spaceBtwItems,
        children: [
          if (!SDeviceUtils.isMobileScreen(context))
            Row(
              spacing: TSizes.spaceBtwItems,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SearchBox(
                  controller: controller.searchController,
                  onChanged: controller.search,
                  hint: 'Search by order number',
                ),
                Row(
                  spacing: TSizes.spaceBtwItems,
                  children: [
                    SizedBox(
                      width: 200,
                      child: SortDropDown(
                        hint: 'Filter by seller',
                        onChanged: (p0) {},
                        values: VerificationStatus.values,
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      child: SortDropDown(
                        hint: 'Bulk Action',
                        onChanged: (p0) {},
                        values: VerificationStatus.values,
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      child: SortDropDown(
                        hint: 'Filter by delivery status',
                        onChanged: (p0) {},
                        values: DeliveryStatus.values,
                      ),
                    ),
                  ],
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
              child: SortDropDown(
                selectedValue: VerificationStatus.all,
                values: VerificationStatus.values,
                onChanged: (p0) {},
              ),
            ),
          Obx(() {
            Visibility(
                visible: false,
                child: Text(controller.filteredDataList.length.toString()));
            return SPaginatedDataTable(
                minWidth: 786,
                dataRowHeight: 56,
                /////pagination

                onPageChanged: (value) {},

                ///////SORTING///////////
                sortAscending: controller.sortAsce.value,
                sortColumnIndex: controller.sortColumnIndex.value,
                columns: [
                  const DataColumn2(
                    label: Text('Order code'),
                  ),
                  DataColumn2(
                    label: const Text(
                      'No. of products',
                    ),
                    onSort: (columnIndex, ascending) =>
                        controller.sortByIndex(columnIndex, ascending),
                  ),
                  const DataColumn2(
                    label: Text('Seller'),
                  ),
                  const DataColumn2(
                    label: Text('Customer'),
                  ),
                  const DataColumn2(
                    label: Text('Amount'),
                  ),
                  DataColumn2(
                    label: const Text('Delivery status'),
                    onSort: (columnIndex, ascending) =>
                        controller.sortByIndex(columnIndex, ascending),
                  ),
                  DataColumn2(
                    label: const Text('Payment method'),
                    onSort: (columnIndex, ascending) =>
                        controller.sortByIndex(columnIndex, ascending),
                  ),
                  DataColumn2(
                    label: const Text('Payment status'),
                    onSort: (columnIndex, ascending) =>
                        controller.sortByIndex(columnIndex, ascending),
                  ),
                  const DataColumn2(
                    label: Text('Refund'),
                  ),
                  const DataColumn2(
                    label: Text('Options'),
                  ),
                ],
                source: SalesDataSource());
          }),
        ],
      ),
    );
  }
}
